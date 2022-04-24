import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_zone_model.freezed.dart';
part 'time_zone_model.g.dart';

@freezed
class TimeZoneModel with _$TimeZoneModel {
  const factory TimeZoneModel({
    @Default('') String timeZone,
    @Default('') String currentLocalTime,
    @Default(OffsetModel()) OffsetModel currentUtcOffset,
    @Default(OffsetModel()) OffsetModel standardUtcOffset,
    @Default(false) bool hasDayLightSaving,
    @Default(false) bool isDayLightSavingActive,
    @Default(DstIntervalModel()) DstIntervalModel dstInterval,
  }) = _TimeZoneModel;

  factory TimeZoneModel.fromJson(Map<String, dynamic> json) => _$TimeZoneModelFromJson(json);
}

@freezed
class DstIntervalModel with _$DstIntervalModel {
  const factory DstIntervalModel({
    @Default('') String dstName,
    @Default(OffsetModel()) OffsetModel dstOffsetToUtc,
    @Default(OffsetModel()) OffsetModel dstOffsetToStandardTime,
    @Default('') String dstStart,
    @Default('') String dstEnd,
    @Default(DstDurationModel()) DstDurationModel dstDuration,
  }) = _DstIntervalModel;

  factory DstIntervalModel.fromJson(Map<String, dynamic> json) => _$DstIntervalModelFromJson(json);
}

@freezed
class OffsetModel with _$OffsetModel {
  const factory OffsetModel({
    @Default(0) int seconds,
    @Default(0) int milliseconds,
  }) = _OffsetModel;

  factory OffsetModel.fromJson(Map<String, dynamic> json) => _$OffsetModelFromJson(json);
}

@freezed
class DstDurationModel with _$DstDurationModel {
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

  factory DstDurationModel.fromJson(Map<String, dynamic> json) => _$DstDurationModelFromJson(json);
}
