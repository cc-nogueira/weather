import 'package:freezed_annotation/freezed_annotation.dart';

import 'celcius.dart';

part 'temperatures.freezed.dart';

@freezed
class Temperatures with _$Temperatures {
  const factory Temperatures({
    @Default(Celcius(0)) Celcius temperature,
    @Default(Celcius(0)) Celcius feelsLike,
    @Default(null) Celcius? min,
    @Default(null) Celcius? max,
  }) = _Temperatures;
}

@freezed
class DailyTemperatures with _$DailyTemperatures {
  const factory DailyTemperatures({
    @Default(Celcius(0)) Celcius day,
    @Default(Celcius(0)) Celcius night,
    @Default(Celcius(0)) Celcius evening,
    @Default(Celcius(0)) Celcius morning,
  }) = _DailyTemperatures;
}
