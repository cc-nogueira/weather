import 'package:_domain_layer/domain_layer.dart';

import '../model/time_zone_model.dart';

class TimeZoneMapper {
  const TimeZoneMapper()
      : _offsetMapper = const OffsetMapper(),
        _dstIntervalMapper = const DstIntervalMapper();

  final OffsetMapper _offsetMapper;
  final DstIntervalMapper _dstIntervalMapper;

  TimeZone mapEntity(TimeZoneModel model) => TimeZone(
        timeZone: model.timeZone,
        currentLocalTimeMillis: model.currentLocalTime.isEmpty
            ? 0
            : DateTime.parse(model.currentLocalTime).millisecondsSinceEpoch,
        currentUtcOffset: _offsetMapper.mapEntity(model.currentUtcOffset),
        standardUtcOffset: _offsetMapper.mapEntity(model.standardUtcOffset),
        hasDayLightSaving: model.hasDayLightSaving,
        isDayLightSavingActive: model.isDayLightSavingActive,
        dstInterval: _dstIntervalMapper.mapEntity(model.dstInterval),
      );
}

class OffsetMapper {
  const OffsetMapper();

  TimeZoneOffset mapEntity(OffsetModel offset) => TimeZoneOffset(
        seconds: offset.seconds,
        milliseconds: offset.milliseconds,
      );
}

class DstIntervalMapper {
  const DstIntervalMapper();

  DstInterval mapEntity(DstIntervalModel dstInterval) => DstInterval(
        name: dstInterval.dstName,
        start: dstInterval.dstStart,
        end: dstInterval.dstEnd,
      );
}
