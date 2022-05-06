import 'dart:math';

import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';

import 'weather_icon.dart';

mixin WeatherMixin {
  Widget heroWeatherIcon(City city, Weather weather) => WeatherIconHero(
      city: city, weatherCode: weather.conditions.code, size: 60, day: isDayTime(weather));

  Widget hourlyWeatherIcon(HourlyWeather weather, double size, [Color? color]) => WeatherIcon(
        weatherCode: weather.conditions.code,
        size: size,
        day: isDayTime(weather),
        color: color,
      );

  bool? isDayTime(Localtime weather) {
    final time = weather.localDateTime;
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
