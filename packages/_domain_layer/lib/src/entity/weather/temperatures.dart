import 'package:freezed_annotation/freezed_annotation.dart';

import 'celcius.dart';

part 'temperatures.freezed.dart';

/// Temperatures entity.
///
/// Freezed class with temperature info.
@freezed
class Temperatures with _$Temperatures {
  /// Freezed factory constructor.
  const factory Temperatures({
    @Default(Celcius(0)) Celcius temperature,
    @Default(Celcius(0)) Celcius feelsLike,
    @Default(null) Celcius? min,
    @Default(null) Celcius? max,
  }) = _Temperatures;
}

/// Daily temperatures entity.
///
/// Freezed class with daily temperature info.
@freezed
class DailyTemperatures with _$DailyTemperatures {
  /// Freezed factory constructor.
  const factory DailyTemperatures({
    @Default(Celcius(0)) Celcius day,
    @Default(Celcius(0)) Celcius night,
    @Default(Celcius(0)) Celcius evening,
    @Default(Celcius(0)) Celcius morning,
  }) = _DailyTemperatures;
}
