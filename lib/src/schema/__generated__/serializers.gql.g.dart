// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers =
    (new Serializers().toBuilder()
          ..add(FetchPolicy.serializer)
          ..add(GChannelSettingSnapshotIn.serializer)
          ..add(GDeletePlotConfigData.serializer)
          ..add(GDeletePlotConfigData_deletePlotConfiguration.serializer)
          ..add(GDeletePlotConfigReq.serializer)
          ..add(GDeletePlotConfigVars.serializer)
          ..add(GDevValue.serializer)
          ..add(GPlotConfigsData.serializer)
          ..add(GPlotConfigsData_plotConfiguration.serializer)
          ..add(GPlotConfigsData_plotConfiguration_channels.serializer)
          ..add(GPlotConfigsReq.serializer)
          ..add(GPlotConfigsVars.serializer)
          ..add(GPlotConfigurationSnapshotIn.serializer)
          ..add(GReadDevicesData.serializer)
          ..add(GReadDevicesData_acceleratorData.serializer)
          ..add(GReadDevicesData_acceleratorData_data.serializer)
          ..add(
            GReadDevicesData_acceleratorData_data_result__asScalar.serializer,
          )
          ..add(
            GReadDevicesData_acceleratorData_data_result__asScalarArray
                .serializer,
          )
          ..add(
            GReadDevicesData_acceleratorData_data_result__asStatusReply
                .serializer,
          )
          ..add(GReadDevicesData_acceleratorData_data_result__asText.serializer)
          ..add(
            GReadDevicesData_acceleratorData_data_result__asTextArray
                .serializer,
          )
          ..add(GReadDevicesData_acceleratorData_data_result__base.serializer)
          ..add(GReadDevicesReq.serializer)
          ..add(GReadDevicesVars.serializer)
          ..add(GSetDeviceData.serializer)
          ..add(GSetDeviceData_setDevice.serializer)
          ..add(GSetDeviceReq.serializer)
          ..add(GSetDeviceVars.serializer)
          ..add(GSetUsersConfigData.serializer)
          ..add(GSetUsersConfigData_usersConfiguration.serializer)
          ..add(GSetUsersConfigReq.serializer)
          ..add(GSetUsersConfigVars.serializer)
          ..add(GStartPlotData.serializer)
          ..add(GStartPlotData_startPlot.serializer)
          ..add(GStartPlotData_startPlot_data.serializer)
          ..add(GStartPlotData_startPlot_data_channelData.serializer)
          ..add(
            GStartPlotData_startPlot_data_channelData_result__asScalar
                .serializer,
          )
          ..add(
            GStartPlotData_startPlot_data_channelData_result__asScalarArray
                .serializer,
          )
          ..add(
            GStartPlotData_startPlot_data_channelData_result__base.serializer,
          )
          ..add(GStartPlotReq.serializer)
          ..add(GStartPlotVars.serializer)
          ..add(GStreamDataData.serializer)
          ..add(GStreamDataData_acceleratorData.serializer)
          ..add(GStreamDataData_acceleratorData_data.serializer)
          ..add(
            GStreamDataData_acceleratorData_data_result__asScalar.serializer,
          )
          ..add(
            GStreamDataData_acceleratorData_data_result__asScalarArray
                .serializer,
          )
          ..add(
            GStreamDataData_acceleratorData_data_result__asStatusReply
                .serializer,
          )
          ..add(GStreamDataData_acceleratorData_data_result__asText.serializer)
          ..add(
            GStreamDataData_acceleratorData_data_result__asTextArray.serializer,
          )
          ..add(GStreamDataData_acceleratorData_data_result__base.serializer)
          ..add(GStreamDataReq.serializer)
          ..add(GStreamDataVars.serializer)
          ..add(GTimeSeriesEntryIn.serializer)
          ..add(GUpdatePlotConfigData.serializer)
          ..add(GUpdatePlotConfigReq.serializer)
          ..add(GUpdatePlotConfigVars.serializer)
          ..add(GUsersLastConfigData.serializer)
          ..add(GUsersLastConfigData_usersLastConfiguration.serializer)
          ..add(GUsersLastConfigData_usersLastConfiguration_channels.serializer)
          ..add(GUsersLastConfigReq.serializer)
          ..add(GUsersLastConfigVars.serializer)
          ..add(GXformAvgExpr.serializer)
          ..add(GXformDeviceExpr.serializer)
          ..add(GXformExpr.serializer)
          ..add(GXformRequest.serializer)
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(GChannelSettingSnapshotIn),
            ]),
            () => new ListBuilder<GChannelSettingSnapshotIn>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(GPlotConfigsData_plotConfiguration),
            ]),
            () => new ListBuilder<GPlotConfigsData_plotConfiguration>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(GPlotConfigsData_plotConfiguration_channels),
            ]),
            () =>
                new ListBuilder<GPlotConfigsData_plotConfiguration_channels>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(GReadDevicesData_acceleratorData),
            ]),
            () => new ListBuilder<GReadDevicesData_acceleratorData>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(GReadDevicesData_acceleratorData_data),
            ]),
            () => new ListBuilder<GReadDevicesData_acceleratorData_data>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(GStartPlotData_startPlot_data),
            ]),
            () => new ListBuilder<GStartPlotData_startPlot_data>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(GStartPlotData_startPlot_data_channelData),
            ]),
            () => new ListBuilder<GStartPlotData_startPlot_data_channelData>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(GStreamDataData_acceleratorData_data),
            ]),
            () => new ListBuilder<GStreamDataData_acceleratorData_data>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(
                GUsersLastConfigData_usersLastConfiguration_channels,
              ),
            ]),
            () =>
                new ListBuilder<
                  GUsersLastConfigData_usersLastConfiguration_channels
                >(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(String)]),
            () => new ListBuilder<String>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(String)]),
            () => new ListBuilder<String>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(String)]),
            () => new ListBuilder<String>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(String)]),
            () => new ListBuilder<String>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(String)]),
            () => new ListBuilder<String>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(double)]),
            () => new ListBuilder<double>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(double)]),
            () => new ListBuilder<double>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(double)]),
            () => new ListBuilder<double>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(double)]),
            () => new ListBuilder<double>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(int)]),
            () => new ListBuilder<int>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(String)]),
            () => new ListBuilder<String>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(GTimeSeriesEntryIn),
            ]),
            () => new ListBuilder<GTimeSeriesEntryIn>(),
          ))
        .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
