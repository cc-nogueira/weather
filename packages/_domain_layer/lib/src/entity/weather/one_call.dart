import 'package:freezed_annotation/freezed_annotation.dart';

import 'weather.dart';

part 'one_call.freezed.dart';

@freezed
class OneCall with _$OneCall {
  const factory OneCall({
    @Default(Weather()) Weather currentWeather,
    @Default([]) List<HourlyWeather> hourly,
    @Default([]) List<DailyWeather> daily,
  }) = _OneCall;
}
