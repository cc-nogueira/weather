import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_zone.freezed.dart';

/// TimeZone entity.
///
/// Freezed class with time zone information.
/// It also provides a getter to convert int millis to currentLocalTime.
@freezed
class TimeZone with _$TimeZone {
  /// Freezed factory constructor.
  const factory TimeZone({
    @Default('') String timeZone,
    @Default(0) int currentLocalTimeMillis,
    @Default(TimeZoneOffset()) TimeZoneOffset currentUtcOffset,
    @Default(TimeZoneOffset()) TimeZoneOffset standardUtcOffset,
    @Default(false) bool hasDayLightSaving,
    @Default(false) bool isDayLightSavingActive,
    @Default(DstInterval()) DstInterval dstInterval,
  }) = _TimeZone;

  /// Private constructor.
  const TimeZone._();

  /// Current local time as DateTime.
  DateTime get currentLocalTime => DateTime.fromMillisecondsSinceEpoch(currentLocalTimeMillis, isUtc: false);

  /// Current UTC offest duration.
  Duration get currentUtcOffsetDuration => Duration(seconds: currentUtcOffset.seconds);
}

/// TimeZoneOffset entity used by TimeZone.
@freezed
class TimeZoneOffset with _$TimeZoneOffset {
  const factory TimeZoneOffset({
    @Default(0) int seconds,
    @Default(0) int milliseconds,
  }) = _TimeZoneOffset;
}

/// DstInterval entity used by TimeZone.
@freezed
class DstInterval with _$DstInterval {
  const factory DstInterval({
    @Default('') String name,
    @Default('') String start,
    @Default('') String end,
  }) = _DstInterval;
}
