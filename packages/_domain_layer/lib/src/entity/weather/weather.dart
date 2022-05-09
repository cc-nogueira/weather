import 'package:freezed_annotation/freezed_annotation.dart';

import 'conditions.dart';
import 'geo.dart';

part 'weather.freezed.dart';

mixin Localtime {
  int get dateTimeMillis;
  Geo get geo;

  DateTime get utcDateTime => DateTime.fromMillisecondsSinceEpoch(dateTimeMillis, isUtc: true);
  DateTime get localShiftedDateTime {
    final shifted =
        DateTime.fromMillisecondsSinceEpoch(dateTimeMillis + geo.timeShiftMillis, isUtc: true);
    return DateTime(shifted.year, shifted.month, shifted.day, shifted.hour, shifted.minute,
        shifted.second, shifted.millisecond, shifted.microsecond);
  }
}

abstract class ConditionsContainer {
  Conditions get conditions;
}

abstract class WeatherContainer {
  Weather get weather;
}

@freezed
class Weather with _$Weather, Localtime implements ConditionsContainer {
  const Weather._();
  const factory Weather({
    @Default(0) int dateTimeMillis,
    @Default(Geo()) Geo geo,
    @Default(Conditions()) Conditions conditions,
  }) = _Weather;
}

@freezed
class DailyWeather with _$DailyWeather, Localtime {
  const DailyWeather._();
  const factory DailyWeather({
    @Default(0) int dateTimeMillis,
    @Default(Geo()) Geo geo,
    @Default(DailyConditions()) DailyConditions conditions,
  }) = _DailyWeather;
}

@freezed
class HourlyWeather with _$HourlyWeather, Localtime implements ConditionsContainer {
  const HourlyWeather._();
  const factory HourlyWeather({
    @Default(0) int dateTimeMillis,
    @Default(Geo()) Geo geo,
    @Default(Conditions()) Conditions conditions,
  }) = _HourlyWeather;
}
