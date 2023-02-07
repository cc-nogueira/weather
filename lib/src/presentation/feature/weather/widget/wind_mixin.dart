import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../domain_layer.dart';
import 'color_range_mixin.dart';
import 'weather_icons.dart';

final _colorStops = <double, Color>{
  0.0: Colors.blue[100]!,
  3.0: Colors.blue[600]!,
  6.0: Colors.blue[900]!,
  8.0: Colors.yellow,
  10.0: Colors.orange[900]!,
  15.0: Colors.red[900]!,
};

const _rangeStops = <double>[0.0, 3.0, 6.0, 10.0, 15.0];

mixin WindMixin on ColorRangeMixin {
  Map<double, Color> get windColorStops => _colorStops;

  List<double> get windRangeStops => _rangeStops;

  double get windScaleMinReference => 4.0;

  List<Color> windColors() => rangeColors(_rangeStops, _colorStops);

  Color windColor(Wind wind) => rangeColor(_colorStops, wind.speed);

  Color? gustColor(Wind wind) => wind.gust == null ? null : rangeColor(_colorStops, wind.gust!);

  Widget hourlyWindIcon(Wind wind, double size, [Color? color]) => Transform.rotate(
        angle: wind.directionTo * pi / 180,
        alignment: Alignment.center,
        child: SizedBox(
          width: size,
          height: size,
          child: Image(
            color: color,
            fit: BoxFit.contain,
            image: const AssetImage('assets/image/wind_direction_white.png'),
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

  Widget _windIcon({required int degree, required double size, required Color color}) => Transform.rotate(
        angle: degree * pi / 180,
        alignment: Alignment.center,
        child: WeatherIcons.instance.windDeg(size, color),
      );
}
