import 'package:freezed_annotation/freezed_annotation.dart';

import 'weather.dart';

part 'current_weather.freezed.dart';

@freezed
class CurrentWeather with _$CurrentWeather implements WeatherContainer {
  const factory CurrentWeather({
    @Default('') String name,
    @Default(Weather()) Weather weather,
  }) = _CurrentWeather;
}
