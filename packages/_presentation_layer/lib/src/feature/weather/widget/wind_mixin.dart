import 'dart:math';

import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';

import 'weather_icons.dart';

mixin WindMixin {
  Color windColor(Wind wind) {
    final speed = wind.speed;
    if (speed < 2.5) {
      return Color.lerp(Colors.blue[100], Colors.blue[600]!, _rangePercent(speed, 0, 2.5))!;
    } else if (speed < 6.0) {
      return Color.lerp(Colors.blue[600]!, Colors.blue[900]!, _rangePercent(speed, 2.5, 6.0))!;
    } else if (speed < 10.0) {
      return Color.lerp(Colors.blue[900]!, Colors.orange[900]!, _rangePercent(speed, 6.0, 10.0))!;
    } else {
      return Color.lerp(Colors.orange[900]!, Colors.red[900]!, _rangePercent(speed, 10.0, 15.0))!;
    }
  }

  Widget hourlyWindIcon(Wind wind, double size, [Color? color]) => Transform.rotate(
        angle: wind.directionTo * pi / 180,
        alignment: Alignment.center,
        child: SizedBox(
          width: size,
          height: size,
          child: Image(
            color: color,
            fit: BoxFit.contain,
            image: const AssetImage(
              'assets/image/wind_direction_white.png',
              package: '_presentation_layer',
            ),
          ),
        ),
      );

  Widget windIcon(Wind wind, {required Color color, required double size}) =>
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

  Widget _windIcon({required int degree, required double size, required Color color}) =>
      Transform.rotate(
        angle: degree * pi / 180,
        alignment: Alignment.center,
        child: WeatherIcons.instance.windDeg(size: size, color: color),
      );

  double _rangePercent(double value, double start, double end) {
    if (start > end) {
      value *= -1;
      start *= -1;
      end *= -1;
    }
    if (value <= start) return 0;
    if (value >= end) return 1;
    return (value - start) / (end - start);
  }
}
