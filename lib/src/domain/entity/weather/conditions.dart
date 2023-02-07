import 'package:freezed_annotation/freezed_annotation.dart';

import 'celcius.dart';
import 'temperatures.dart';
import 'wind.dart';

part 'conditions.freezed.dart';

/// Weather hourly conditions entity.
///
/// Freezed class with hourly weather conditions info.
@freezed
class Conditions with _$Conditions {
  /// Freezed factory constructor.
  const factory Conditions({
    @Default(0) int code,
    @Default('') String title,
    @Default('') String description,
    @Default(0) int humidity,
    @Default(0) int pressure,
    @Default(0) int clouds,
    @Default(Temperatures()) Temperatures temperatures,
    @Default(Wind()) Wind wind,
    @Default(null) double? pop,
    @Default(null) double? rain1h,
    @Default(null) double? snow1h,
  }) = _Conditions;
}

/// Weather daily confitions entity.
///
/// Freezed class with daily weather conditions info.
@freezed
class DailyConditions with _$DailyConditions {
  /// Freezed factory constructor.
  const factory DailyConditions({
    @Default(0) int code,
    @Default('') String title,
    @Default('') String description,
    @Default(0) int humidity,
    @Default(0) int pressure,
    @Default(0) int clouds,
    @Default(DailyTemperatures()) DailyTemperatures dailyTemperatures,
    @Default(DailyTemperatures()) DailyTemperatures dailyFeelsLike,
    @Default(Celcius(0)) Celcius dailyMin,
    @Default(Celcius(0)) Celcius dailyMax,
    @Default(Wind()) Wind wind,
    @Default(null) double? pop,
    @Default(null) double? rain,
    @Default(null) double? snow,
  }) = _DailyConditions;
}
