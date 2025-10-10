// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:dart_gql_acsys/src/schema/__generated__/DPM.schema.gql.dart'
    show
        GChannelSettingSnapshotIn,
        GDevValue,
        GPlotConfigurationSnapshotIn,
        GTimeSeriesEntryIn,
        GXformAvgExpr,
        GXformDeviceExpr,
        GXformExpr,
        GXformRequest;
import 'package:dart_gql_acsys/src/schema/__generated__/plot_configs.data.gql.dart'
    show
        GPlotConfigsData,
        GPlotConfigsData_plotConfiguration,
        GPlotConfigsData_plotConfiguration_channels;
import 'package:dart_gql_acsys/src/schema/__generated__/plot_configs.req.gql.dart'
    show GPlotConfigsReq;
import 'package:dart_gql_acsys/src/schema/__generated__/plot_configs.var.gql.dart'
    show GPlotConfigsVars;
import 'package:dart_gql_acsys/src/schema/__generated__/read_devices.data.gql.dart'
    show
        GReadDevicesData_acceleratorData_data_result,
        GReadDevicesData,
        GReadDevicesData_acceleratorData,
        GReadDevicesData_acceleratorData_data,
        GReadDevicesData_acceleratorData_data_result__asScalar,
        GReadDevicesData_acceleratorData_data_result__asScalarArray,
        GReadDevicesData_acceleratorData_data_result__asStatusReply,
        GReadDevicesData_acceleratorData_data_result__asText,
        GReadDevicesData_acceleratorData_data_result__asTextArray,
        GReadDevicesData_acceleratorData_data_result__base;
import 'package:dart_gql_acsys/src/schema/__generated__/read_devices.req.gql.dart'
    show GReadDevicesReq;
import 'package:dart_gql_acsys/src/schema/__generated__/read_devices.var.gql.dart'
    show GReadDevicesVars;
import 'package:dart_gql_acsys/src/schema/__generated__/remove_plot_config.data.gql.dart'
    show GDeletePlotConfigData, GDeletePlotConfigData_deletePlotConfiguration;
import 'package:dart_gql_acsys/src/schema/__generated__/remove_plot_config.req.gql.dart'
    show GDeletePlotConfigReq;
import 'package:dart_gql_acsys/src/schema/__generated__/remove_plot_config.var.gql.dart'
    show GDeletePlotConfigVars;
import 'package:dart_gql_acsys/src/schema/__generated__/set_device.data.gql.dart'
    show GSetDeviceData, GSetDeviceData_setDevice;
import 'package:dart_gql_acsys/src/schema/__generated__/set_device.req.gql.dart'
    show GSetDeviceReq;
import 'package:dart_gql_acsys/src/schema/__generated__/set_device.var.gql.dart'
    show GSetDeviceVars;
import 'package:dart_gql_acsys/src/schema/__generated__/set_users_config.data.gql.dart'
    show GSetUsersConfigData, GSetUsersConfigData_usersConfiguration;
import 'package:dart_gql_acsys/src/schema/__generated__/set_users_config.req.gql.dart'
    show GSetUsersConfigReq;
import 'package:dart_gql_acsys/src/schema/__generated__/set_users_config.var.gql.dart'
    show GSetUsersConfigVars;
import 'package:dart_gql_acsys/src/schema/__generated__/start_plot.data.gql.dart'
    show
        GStartPlotData_startPlot_data_channelData_result,
        GStartPlotData,
        GStartPlotData_startPlot,
        GStartPlotData_startPlot_data,
        GStartPlotData_startPlot_data_channelData,
        GStartPlotData_startPlot_data_channelData_result__asScalar,
        GStartPlotData_startPlot_data_channelData_result__asScalarArray,
        GStartPlotData_startPlot_data_channelData_result__base;
import 'package:dart_gql_acsys/src/schema/__generated__/start_plot.req.gql.dart'
    show GStartPlotReq;
import 'package:dart_gql_acsys/src/schema/__generated__/start_plot.var.gql.dart'
    show GStartPlotVars;
import 'package:dart_gql_acsys/src/schema/__generated__/stream_data.data.gql.dart'
    show
        GStreamDataData_acceleratorData_data_result,
        GStreamDataData,
        GStreamDataData_acceleratorData,
        GStreamDataData_acceleratorData_data,
        GStreamDataData_acceleratorData_data_result__asScalar,
        GStreamDataData_acceleratorData_data_result__asScalarArray,
        GStreamDataData_acceleratorData_data_result__asStatusReply,
        GStreamDataData_acceleratorData_data_result__asText,
        GStreamDataData_acceleratorData_data_result__asTextArray,
        GStreamDataData_acceleratorData_data_result__base;
import 'package:dart_gql_acsys/src/schema/__generated__/stream_data.req.gql.dart'
    show GStreamDataReq;
import 'package:dart_gql_acsys/src/schema/__generated__/stream_data.var.gql.dart'
    show GStreamDataVars;
import 'package:dart_gql_acsys/src/schema/__generated__/update_plot_config.data.gql.dart'
    show GUpdatePlotConfigData;
import 'package:dart_gql_acsys/src/schema/__generated__/update_plot_config.req.gql.dart'
    show GUpdatePlotConfigReq;
import 'package:dart_gql_acsys/src/schema/__generated__/update_plot_config.var.gql.dart'
    show GUpdatePlotConfigVars;
import 'package:dart_gql_acsys/src/schema/__generated__/users_last_config.data.gql.dart'
    show
        GUsersLastConfigData,
        GUsersLastConfigData_usersLastConfiguration,
        GUsersLastConfigData_usersLastConfiguration_channels;
import 'package:dart_gql_acsys/src/schema/__generated__/users_last_config.req.gql.dart'
    show GUsersLastConfigReq;
import 'package:dart_gql_acsys/src/schema/__generated__/users_last_config.var.gql.dart'
    show GUsersLastConfigVars;
import 'package:dart_gql_acsys/src/schema/date_serializer.dart'
    show DateSerializer;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:gql_code_builder_serializers/gql_code_builder_serializers.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder =
    _$serializers.toBuilder()
      ..add(OperationSerializer())
      ..add(DateSerializer())
      ..add(GReadDevicesData_acceleratorData_data_result.serializer)
      ..add(GStartPlotData_startPlot_data_channelData_result.serializer)
      ..add(GStreamDataData_acceleratorData_data_result.serializer)
      ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GChannelSettingSnapshotIn,
  GDeletePlotConfigData,
  GDeletePlotConfigData_deletePlotConfiguration,
  GDeletePlotConfigReq,
  GDeletePlotConfigVars,
  GDevValue,
  GPlotConfigsData,
  GPlotConfigsData_plotConfiguration,
  GPlotConfigsData_plotConfiguration_channels,
  GPlotConfigsReq,
  GPlotConfigsVars,
  GPlotConfigurationSnapshotIn,
  GReadDevicesData,
  GReadDevicesData_acceleratorData,
  GReadDevicesData_acceleratorData_data,
  GReadDevicesData_acceleratorData_data_result__asScalar,
  GReadDevicesData_acceleratorData_data_result__asScalarArray,
  GReadDevicesData_acceleratorData_data_result__asStatusReply,
  GReadDevicesData_acceleratorData_data_result__asText,
  GReadDevicesData_acceleratorData_data_result__asTextArray,
  GReadDevicesData_acceleratorData_data_result__base,
  GReadDevicesReq,
  GReadDevicesVars,
  GSetDeviceData,
  GSetDeviceData_setDevice,
  GSetDeviceReq,
  GSetDeviceVars,
  GSetUsersConfigData,
  GSetUsersConfigData_usersConfiguration,
  GSetUsersConfigReq,
  GSetUsersConfigVars,
  GStartPlotData,
  GStartPlotData_startPlot,
  GStartPlotData_startPlot_data,
  GStartPlotData_startPlot_data_channelData,
  GStartPlotData_startPlot_data_channelData_result__asScalar,
  GStartPlotData_startPlot_data_channelData_result__asScalarArray,
  GStartPlotData_startPlot_data_channelData_result__base,
  GStartPlotReq,
  GStartPlotVars,
  GStreamDataData,
  GStreamDataData_acceleratorData,
  GStreamDataData_acceleratorData_data,
  GStreamDataData_acceleratorData_data_result__asScalar,
  GStreamDataData_acceleratorData_data_result__asScalarArray,
  GStreamDataData_acceleratorData_data_result__asStatusReply,
  GStreamDataData_acceleratorData_data_result__asText,
  GStreamDataData_acceleratorData_data_result__asTextArray,
  GStreamDataData_acceleratorData_data_result__base,
  GStreamDataReq,
  GStreamDataVars,
  GTimeSeriesEntryIn,
  GUpdatePlotConfigData,
  GUpdatePlotConfigReq,
  GUpdatePlotConfigVars,
  GUsersLastConfigData,
  GUsersLastConfigData_usersLastConfiguration,
  GUsersLastConfigData_usersLastConfiguration_channels,
  GUsersLastConfigReq,
  GUsersLastConfigVars,
  GXformAvgExpr,
  GXformDeviceExpr,
  GXformExpr,
  GXformRequest,
])
final Serializers serializers = _serializersBuilder.build();
