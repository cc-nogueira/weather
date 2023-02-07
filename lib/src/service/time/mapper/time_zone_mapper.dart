import '../../../domain/entity/time_zone/time_zone.dart';
import '../model/time_zone_model.dart';

/// TimeZoneMapper converts [TimeZoneModel] to [TimeZone] entity.
///
/// This is a one-way only conversion. Only from Model to Entity.
class TimeZoneMapper {
  /// Const constructor
  const TimeZoneMapper()
      : _offsetMapper = const OffsetMapper(),
        _dstIntervalMapper = const DstIntervalMapper();

  /// Offset helper mapper
  final OffsetMapper _offsetMapper;

  /// DstInterval helper mapper
  final DstIntervalMapper _dstIntervalMapper;

  /// Maps a TimeZone service Model to [TimeZone] domain Entity.
  TimeZone mapEntity(TimeZoneModel model) => TimeZone(
        timeZone: model.timeZone,
        currentLocalTimeMillis:
            model.currentLocalTime.isEmpty ? 0 : DateTime.parse(model.currentLocalTime).millisecondsSinceEpoch,
        currentUtcOffset: _offsetMapper.mapEntity(model.currentUtcOffset),
        standardUtcOffset: _offsetMapper.mapEntity(model.standardUtcOffset),
        hasDayLightSaving: model.hasDayLightSaving,
        isDayLightSavingActive: model.isDayLightSavingActive,
        dstInterval: _dstIntervalMapper.mapEntity(model.dstInterval),
      );
}

/// OffserMapper converts [OffsetModel] to [TimeZoneOffset] entity.
///
/// This is a one-way only conversion. Only from Model to Entity.
class OffsetMapper {
  /// Const constructor.
  const OffsetMapper();

  /// Maps a Offset service Model to [TimeZoneOffset] domain Entity.
  TimeZoneOffset mapEntity(OffsetModel offset) => TimeZoneOffset(
        seconds: offset.seconds,
        milliseconds: offset.milliseconds,
      );
}

/// DstIntervalMapper converts [DstIntervalModel] to [DstInterval] entity.
///
/// This is a one-way only conversion. Only from Model to Entity.
class DstIntervalMapper {
  const DstIntervalMapper();

  /// Maps a DstInterval service Model to [DstInterval] domain Entity.
  DstInterval mapEntity(DstIntervalModel dstInterval) => DstInterval(
        name: dstInterval.dstName,
        start: dstInterval.dstStart,
        end: dstInterval.dstEnd,
      );
}
