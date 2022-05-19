import 'package:freezed_annotation/freezed_annotation.dart';

import 'alert.dart';
import 'weather.dart';

part 'one_call_weather.freezed.dart';

@freezed
class OneCallWeather with _$OneCallWeather implements WeatherContainer {
  const factory OneCallWeather({
    @Default(Weather()) Weather weather,
    @Default([]) List<HourlyWeather> hourly,
    @Default([]) List<DailyWeather> daily,
    @Default([]) List<Alert> alerts,
  }) = _OneCallWeather;
}
