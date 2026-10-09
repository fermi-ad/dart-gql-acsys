/// GraphQL client implementation for the BLM API.
///
/// This service targets the BLM schema separately from the ACSys schema. It
/// uses HTTP for the integrated-loss query and WebSocket for subscriptions.
library;

import 'dart:developer' as dev;

import 'package:gql/ast.dart' show DocumentNode;
import 'package:graphql/client.dart';
import 'package:http/http.dart' as http;

import 'blm_api.dart';
import 'exceptions.dart';

/// A client for the BLM GraphQL query and subscription API.
final class BlmService implements BlmServiceAPI {
  static final DocumentNode _docIntegratedLossDevices = gql(r'''
    query IntegratedLossDevices(
      $beamLine: BlmBeamLine!,
      $tclkEvent: Int!
    ) {
      integratedLossDevices(
        beamLine: $beamLine,
        tclkEvent: $tclkEvent
      ) {
        device
        metadata {
          devicePlotLabel
        }
      }
    }
  ''');

  static final DocumentNode _docLossRatios = gql(r'''
    subscription LossRatios(
      $beamLine: BlmBeamLine!,
      $tclkEvent: Int!,
      $sampleRateMs: Int!
    ) {
      lossRatios(
        beamLine: $beamLine,
        tclkEvent: $tclkEvent,
        sampleRateMs: $sampleRateMs
      ) {
        ratios {
          deviceData {
            device
            metadata {
              devicePlotLabel
            }
          }
          integratedLoss
          lossLimit
          ratio
          timestamp
          status {
            facilityCode
            statusCode
            message
          }
        }
      }
    }
  ''');

  static final DocumentNode _docBeamThroughput = gql(r'''
    subscription BeamThroughput(
      $beamLine: BlmBeamLine!,
      $sampleRateMs: Int!
    ) {
      beamThroughput(
        beamLine: $beamLine,
        sampleRateMs: $sampleRateMs
      ) {
        beamLine
        protonsPerPulse
        protonsPerHour
        protonsPerHourLimit
        efficiencies {
          tclkEvent
          efficiency
          protonsPerHour
        }
      }
    }
  ''');

  final GraphQLClient _client;
  bool _disposed = false;

  /// Creates a BLM client using the supplied HTTP and WebSocket endpoints.
  ///
  /// [httpUrl] should identify the BLM GraphQL query endpoint, normally a
  /// URL ending in `/blm`. [wsUrl] should identify its subscription endpoint,
  /// normally a URL ending in `/blm/s`.
  BlmService({required String httpUrl, required String wsUrl, String? jwt})
    : _client = _buildClient(httpUrl: httpUrl, wsUrl: wsUrl, jwt: jwt);

  static GraphQLClient _buildClient({
    required String httpUrl,
    required String wsUrl,
    required String? jwt,
  }) => GraphQLClient(
    link: Link.split(
      (request) => request.isSubscription,
      WebSocketLink(
        wsUrl,
        config: SocketClientConfig(
          autoReconnect: true,
          initialPayload: jwt != null ? {'Authorization': 'Bearer $jwt'} : null,
          queryAndMutationTimeout: const Duration(seconds: 5),
          inactivityTimeout: null,
        ),
        subProtocol: 'graphql-ws',
      ),
      HttpLink(
        httpUrl,
        defaultHeaders: jwt != null ? {'Authorization': 'Bearer $jwt'} : {},
        httpClient: http.Client(),
      ),
    ),
    queryRequestTimeout: const Duration(seconds: 5),
    cache: GraphQLCache(store: InMemoryStore()),
  );

  void _ensureActive() {
    if (_disposed) {
      throw StateError('BlmService has been disposed');
    }
  }

  static void _validateTclkEvent(int value) {
    if (value < 0 || value > 255) {
      throw const ACSysInvArgException(
        'BLM tclkEvent must be between 0 and 255',
      );
    }
  }

  static void _validateSampleRate(int value) {
    if (value <= 0) {
      throw const ACSysInvArgException(
        'BLM sampleRateMs must be greater than zero',
      );
    }
  }

  static QueryResult _checkResult(QueryResult result, String nullDataMessage) {
    if (result.exception?.linkException != null) {
      final linkException = result.exception!.linkException!;
      final message =
          'Network error: '
          '${linkException.originalException ?? linkException.toString()}';
      dev.log(message, name: 'BLM.GraphQL', error: linkException);
      throw ACSysGraphQLException(message);
    }

    if (result.exception?.graphqlErrors.isNotEmpty ?? false) {
      final messages = result.exception!.graphqlErrors
          .map(
            (error) =>
                '${error.message}'
                '${error.path != null ? ' at path: ${error.path}' : ''}',
          )
          .join('; ');
      final message = 'GraphQL errors: $messages';
      dev.log(
        message,
        name: 'BLM.GraphQL',
        error: result.exception!.graphqlErrors,
      );
      throw ACSysGraphQLException(message);
    }

    if (result.hasException) {
      final message = 'Unknown GraphQL exception: ${result.exception}';
      dev.log(message, name: 'BLM.GraphQL', error: result.exception);
      throw ACSysGraphQLException(message);
    }

    if (result.data == null) {
      dev.log(nullDataMessage, name: 'BLM.GraphQL');
      throw ACSysGraphQLException(nullDataMessage);
    }

    return result;
  }

  Future<QueryResult> _query({
    required DocumentNode document,
    required Map<String, dynamic> variables,
  }) async {
    _ensureActive();
    final result = await _client.query(
      QueryOptions(
        document: document,
        variables: variables,
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    return _checkResult(result, 'BLM query succeeded but returned no data');
  }

  Stream<QueryResult> _subscription({
    required DocumentNode document,
    required Map<String, dynamic> variables,
  }) {
    _ensureActive();
    return _client
        .subscribe(
          SubscriptionOptions(
            document: document,
            variables: variables,
            fetchPolicy: FetchPolicy.networkOnly,
          ),
        )
        .where((event) => event.isNotLoading)
        .map(
          (result) =>
              _checkResult(result, 'BLM subscription event returned no data'),
        );
  }

  static Map<String, dynamic> _rootObject(QueryResult result, String field) {
    final value = result.data![field];
    if (value is Map<String, dynamic>) return value;
    throw ACSysGraphQLException(
      'BLM response field "$field" was not an object',
    );
  }

  @override
  Future<List<BlmDevice>> integratedLossDevices({
    required BlmBeamLine beamLine,
    required int tclkEvent,
  }) async {
    _validateTclkEvent(tclkEvent);
    final result = await _query(
      document: _docIntegratedLossDevices,
      variables: {'beamLine': beamLine.graphqlName, 'tclkEvent': tclkEvent},
    );

    final value = result.data!['integratedLossDevices'];
    if (value is! List<Object?>) {
      throw const ACSysGraphQLException(
        'BLM response field "integratedLossDevices" was not a list',
      );
    }
    return value
        .map(
          (item) =>
              BlmDevice.fromJson(_mapObject(item, 'integratedLossDevices')),
        )
        .toList(growable: false);
  }

  @override
  Stream<BlmLossRatioSample> lossRatios({
    required BlmBeamLine beamLine,
    required int tclkEvent,
    required int sampleRateMs,
  }) {
    _validateTclkEvent(tclkEvent);
    _validateSampleRate(sampleRateMs);
    return _subscription(
      document: _docLossRatios,
      variables: {
        'beamLine': beamLine.graphqlName,
        'tclkEvent': tclkEvent,
        'sampleRateMs': sampleRateMs,
      },
    ).map(
      (result) =>
          BlmLossRatioSample.fromJson(_rootObject(result, 'lossRatios')),
    );
  }

  @override
  Stream<BlmBeamThroughputSample> beamThroughput({
    required BlmBeamLine beamLine,
    required int sampleRateMs,
  }) {
    _validateSampleRate(sampleRateMs);
    return _subscription(
      document: _docBeamThroughput,
      variables: {
        'beamLine': beamLine.graphqlName,
        'sampleRateMs': sampleRateMs,
      },
    ).map(
      (result) => BlmBeamThroughputSample.fromJson(
        _rootObject(result, 'beamThroughput'),
      ),
    );
  }

  static Map<String, dynamic> _mapObject(Object? value, String field) {
    if (value is Map<String, dynamic>) return value;
    throw ACSysGraphQLException(
      'BLM response field "$field" contains a non-object value',
    );
  }

  @override
  Future<void> dispose() async {
    if (_disposed) return;
    _disposed = true;
    _client.link.dispose();
  }
}
