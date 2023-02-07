import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../domain_layer.dart';
import 'weather_icon_hero.dart';
import 'weather_icons.dart';

mixin WeatherMixin {
  Widget heroWeatherIcon(City city, Weather weather) =>
      WeatherIconHero(city: city, weatherCode: weather.conditions.code, size: 60, isDayTime: isDayTime(weather));

  Widget hourlyWeatherIcon(
    HourlyWeather weather, {
    required double size,
    required Color color,
  }) =>
      WeatherIcons.forOpenWeather(
        openWeatherCode: weather.conditions.code,
        size: size,
        color: color,
        isDayTime: isDayTime(weather),
      );

  Widget weatherIcon(
    int conditionsCode, {
    required double size,
    required Color color,
  }) =>
      WeatherIcons.forOpenWeather(
        openWeatherCode: conditionsCode,
        size: size,
        color: color,
        isDayTime: null,
      );

  bool? isDayTime(Localtime weather) {
    final time = weather.localShiftedDateTime;
    final sunrise = weather.geo.localSunrise;
    final sunset = weather.geo.localSunset;
    if (_minutesBetween(time, sunrise) < 60) return null;
    if (_minutesBetween(time, sunset) < 60) return null;
    return _minutes(time) > _minutes(sunrise) && _minutes(time) < _minutes(sunset);
  }

  int _minutesBetween(DateTime a, DateTime b) {
    final sub = (_minutes(a) - _minutes(b)).abs();
    return min(sub, 24 * 60 - sub);
  }

  int _minutes(DateTime dt) => dt.hour * 60 + dt.minute;
}
