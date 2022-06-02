import 'package:freezed_annotation/freezed_annotation.dart';

import 'alert.dart';
import 'weather.dart';

part 'one_call_weather.freezed.dart';

/// OneCallWeather service main entity.
///
/// Freezed class with OneCallWeather service response.
@freezed
class OneCallWeather with _$OneCallWeather implements WeatherContainer {
  /// Freezed factory constructor.
  const factory OneCallWeather({
    @Default(Weather()) Weather weather,
    @Default([]) List<HourlyWeather> hourly,
    @Default([]) List<DailyWeather> daily,
    @Default([]) List<Alert> alerts,
  }) = _OneCallWeather;
}
