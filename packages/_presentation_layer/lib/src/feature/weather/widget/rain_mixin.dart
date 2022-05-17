import 'package:flutter/material.dart';

import 'color_range_mixin.dart';

final _colorStops = <double, Color>{
  0.0: Colors.blue[100]!,
  2.5: Colors.blue[600]!,
  7.5: Colors.blue[900]!,
  18.75: Colors.yellow,
  30.0: Colors.orange[900]!,
  50.0: Colors.red[900]!,
};

const _rangeStops = <double>[0.0, 2.5, 7.5, 30.0, 50.0];

mixin RainMixin on ColorRangeMixin {
  Map<double, Color> get rainColorStops => _colorStops;

  List<double> get rainRangeStops => _rangeStops;

  double get rainScaleMinReference => 4.0;

  List<Color> rainColors() => rangeColors(_rangeStops, _colorStops);

  Color rainColor(double mmPerHour) => rangeColor(_colorStops, mmPerHour);
}
