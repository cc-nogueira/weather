import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_zone.freezed.dart';

@freezed
class TimeZone with _$TimeZone {
  const TimeZone._();
  const factory TimeZone({
    @Default('') String timeZone,
    @Default(0) int currentLocalTimeMillis,
    @Default(TimeZoneOffset()) TimeZoneOffset currentUtcOffset,
    @Default(TimeZoneOffset()) TimeZoneOffset standardUtcOffset,
    @Default(false) bool hasDayLightSaving,
    @Default(false) bool isDayLightSavingActive,
    @Default(DstInterval()) DstInterval dstInterval,
  }) = _TimeZone;

  DateTime get currentLocalTime =>
      DateTime.fromMillisecondsSinceEpoch(currentLocalTimeMillis, isUtc: false);

  Duration get currentUtcOffsetDuration => Duration(seconds: currentUtcOffset.seconds);
}

@freezed
class TimeZoneOffset with _$TimeZoneOffset {
  const factory TimeZoneOffset({
    @Default(0) int seconds,
    @Default(0) int milliseconds,
  }) = _TimeZoneOffset;
}

@freezed
class DstInterval with _$DstInterval {
  const factory DstInterval({
    @Default('') String name,
    @Default('') String start,
    @Default('') String end,
  }) = _DstInterval;
}
