import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_zone_model.freezed.dart';
part 'time_zone_model.g.dart';

/// TimeZone Service Model.
///
/// Freezed class with TimeZone service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class TimeZoneModel with _$TimeZoneModel {
  /// Freezed factory constructor.
  const factory TimeZoneModel({
    @Default('') String timeZone,
    @Default('') String currentLocalTime,
    @Default(OffsetModel()) OffsetModel currentUtcOffset,
    @Default(OffsetModel()) OffsetModel standardUtcOffset,
    @Default(false) bool hasDayLightSaving,
    @Default(false) bool isDayLightSavingActive,
    @Default(DstIntervalModel()) DstIntervalModel dstInterval,
  }) = _TimeZoneModel;

  /// JSON factory constructor.
  factory TimeZoneModel.fromJson(Map<String, dynamic> json) => _$TimeZoneModelFromJson(json);
}

/// DstInterval Service Model.
///
/// Freezed class with DstInterval service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class DstIntervalModel with _$DstIntervalModel {
  /// Freezed factory constructor.
  const factory DstIntervalModel({
    @Default('') String dstName,
    @Default(OffsetModel()) OffsetModel dstOffsetToUtc,
    @Default(OffsetModel()) OffsetModel dstOffsetToStandardTime,
    @Default('') String dstStart,
    @Default('') String dstEnd,
    @Default(DstDurationModel()) DstDurationModel dstDuration,
  }) = _DstIntervalModel;

  /// JSON factory constructor.
  factory DstIntervalModel.fromJson(Map<String, dynamic> json) => _$DstIntervalModelFromJson(json);
}

/// Offset Service Model.
///
/// Freezed class with Offset service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class OffsetModel with _$OffsetModel {
  /// Freezed factory constructor.
  const factory OffsetModel({
    @Default(0) int seconds,
    @Default(0) int milliseconds,
  }) = _OffsetModel;

  /// JSON factory constructor.
  factory OffsetModel.fromJson(Map<String, dynamic> json) => _$OffsetModelFromJson(json);
}

/// DstDuration Service Model.
///
/// Freezed class with DstDuration service info.
/// Provides conversion from service JSON to this service Model.
@freezed
class DstDurationModel with _$DstDurationModel {
  /// Freezed factory constructor.
  const factory DstDurationModel({
    @Default(0) int days,
    @Default(0) int hours,
    @Default(0) int minutes,
    @Default(0) int seconds,
    @Default(0) int milliseconds,
    @Default(0) double totalDays,
    @Default(0) int totalHours,
    @Default(0) int totalMinutes,
    @Default(0) int totalSeconds,
    @Default(0) int totalMilliseconds,
  }) = _DstDurationModel;

  /// JSON factory constructor.
  factory DstDurationModel.fromJson(Map<String, dynamic> json) => _$DstDurationModelFromJson(json);
}
