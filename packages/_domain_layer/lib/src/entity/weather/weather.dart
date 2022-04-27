import 'package:freezed_annotation/freezed_annotation.dart';

import 'conditions.dart';
import 'geo.dart';

part 'weather.freezed.dart';

mixin Localtime {
  int get dateTimeMillis;
  Geo get geo;

  DateTime get utcDateTime => DateTime.fromMillisecondsSinceEpoch(dateTimeMillis, isUtc: true);
  DateTime get localDateTime =>
      DateTime.fromMillisecondsSinceEpoch(dateTimeMillis + geo.timeShiftMillis, isUtc: true);
}

abstract class WeatherContainer {
  Weather get weather;
}

@freezed
class Weather with _$Weather, Localtime {
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
class HourlyWeather with _$HourlyWeather, Localtime {
  const HourlyWeather._();
  const factory HourlyWeather({
    @Default(0) int dateTimeMillis,
    @Default(Geo()) Geo geo,
    @Default(Conditions()) Conditions conditions,
  }) = _HourlyWeather;
}
