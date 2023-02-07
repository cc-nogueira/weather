import 'package:freezed_annotation/freezed_annotation.dart';

import 'conditions.dart';
import 'geo.dart';

part 'weather.freezed.dart';

/// Localtime mixin.
///
/// Provides an API to access locatime as UTC DateTime and to access this dateTime shifted to the
/// Geo location local time.
mixin Localtime {
  int get dateTimeMillis;
  Geo get geo;

  /// UTC dateTime
  DateTime get utcDateTime => DateTime.fromMillisecondsSinceEpoch(dateTimeMillis, isUtc: true);

  /// DateTime shifted to the Geo location local time.
  DateTime get localShiftedDateTime {
    final shifted = DateTime.fromMillisecondsSinceEpoch(dateTimeMillis + geo.timeShiftMillis, isUtc: true);
    return DateTime(shifted.year, shifted.month, shifted.day, shifted.hour, shifted.minute, shifted.second,
        shifted.millisecond, shifted.microsecond);
  }
}

/// Common conditions container definition.
abstract class ConditionsContainer {
  Conditions get conditions;
}

/// Common Weather container definition.
abstract class WeatherContainer {
  Weather get weather;
}

/// Weather entity.
///
/// Freezed class with weather info.
/// Implements ConditionsContainer with Localtime API.
@freezed
class Weather with _$Weather, Localtime implements ConditionsContainer {
  /// Freezed factory constructor.
  const factory Weather({
    @Default(0) int dateTimeMillis,
    @Default(Geo()) Geo geo,
    @Default(Conditions()) Conditions conditions,
  }) = _Weather;

  /// Private constructor.
  const Weather._();
}

/// DailyWeather entity.
///
/// Freezed class with daily weather info with Localtime API.
@freezed
class DailyWeather with _$DailyWeather, Localtime {
  /// Freezed factory constructor.
  const factory DailyWeather({
    @Default(0) int dateTimeMillis,
    @Default(Geo()) Geo geo,
    @Default(DailyConditions()) DailyConditions conditions,
  }) = _DailyWeather;

  /// Private constructor.
  const DailyWeather._();
}

/// HourlyWeather entity.
///
/// Freezed class with hourly weather info.
/// Implements ConditionsContainer with Localtime API.
@freezed
class HourlyWeather with _$HourlyWeather, Localtime implements ConditionsContainer {
  /// Freezed factory constructor.
  const factory HourlyWeather({
    @Default(0) int dateTimeMillis,
    @Default(Geo()) Geo geo,
    @Default(Conditions()) Conditions conditions,
  }) = _HourlyWeather;

  /// Private constructor.
  const HourlyWeather._();
}
