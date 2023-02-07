import 'package:freezed_annotation/freezed_annotation.dart';

import 'weather.dart';

part 'current_weather.freezed.dart';

/// Current weather entity.
///
/// Freezed class with current weather info.
@freezed
class CurrentWeather with _$CurrentWeather implements WeatherContainer {
  /// Freezed factory constructor.
  const factory CurrentWeather({
    @Default('') String name,
    @Default(Weather()) Weather weather,
  }) = _CurrentWeather;
}
