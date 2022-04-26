import 'package:freezed_annotation/freezed_annotation.dart';

import 'weather.dart';

part 'one_call_weather.freezed.dart';

@freezed
class OneCallWeather with _$OneCallWeather {
  const factory OneCallWeather({
    @Default(Weather()) Weather currentWeather,
    @Default([]) List<HourlyWeather> hourly,
    @Default([]) List<DailyWeather> daily,
  }) = _OneCallWeather;
}
