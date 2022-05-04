import 'dart:math';

import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

import 'weather_icon.dart';

mixin WeatherWidgetMixin {
  Widget weatherIcon(City city, Weather weather) =>
      WeatherIcon(city: city, weatherCode: weather.conditions.code, size: 60, day: _isDay(weather));

  Widget windIcon(Wind wind, {required Color? color, required double size}) =>
      _windIcon(degree: wind.directionTo, size: size, color: color);

  String windDirectionLabel(Wind wind) {
    final dir = wind.directionFrom;
    if (dir < 11.25) return 'N';
    if (dir < 33.75) return 'NNE';
    if (dir < 46.25) return 'NE';
    if (dir < 78.75) return 'ENE';
    if (dir < 101.25) return 'E';
    if (dir < 123.75) return 'ESE';
    if (dir < 146.25) return 'SE';
    if (dir < 168.75) return 'SSE';
    if (dir < 191.25) return 'S';
    if (dir < 213.75) return 'SSW';
    if (dir < 236.25) return 'SW';
    if (dir < 258.75) return 'WSW';
    if (dir < 281.25) return 'W';
    if (dir < 303.75) return 'WNW';
    if (dir < 326.25) return 'NW';
    if (dir < 348.75) return 'NNW';
    return 'N';
  }

  Widget _windIcon({required int degree, required double size, Color? color}) => Transform.rotate(
        angle: degree * pi / 180,
        alignment: Alignment.center,
        child: SizedBox(
          width: size,
          child: Center(
            child: RichText(
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              text: TextSpan(
                text: String.fromCharCode(WeatherIcons.wind.codePoint),
                style: TextStyle(
                  inherit: false,
                  color: color,
                  fontSize: size,
                  fontFamily: "WeatherIcons",
                  package: "weather_icons",
                ),
              ),
            ),
          ),
        ),
      );

  bool? _isDay(Weather weather) {
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
