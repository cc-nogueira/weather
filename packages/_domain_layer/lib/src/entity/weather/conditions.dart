import 'package:freezed_annotation/freezed_annotation.dart';

import 'celcius.dart';
import 'temperatures.dart';
import 'wind.dart';

part 'conditions.freezed.dart';

@freezed
class Conditions with _$Conditions {
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

@freezed
class DailyConditions with _$DailyConditions {
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
