import 'package:flutter/material.dart';

import 'color_range_mixin.dart';

final _colorStops = <double, Color>{
  0.0: Colors.blue[100]!,
  1.0: Colors.blue[600]!,
  2.5: Colors.blue[900]!,
  5.0: Colors.yellow,
  7.5: Colors.orange[900]!,
  15.0: Colors.red[900]!,
};

const _rangeStops = <double>[0.0, 1.0, 2.5, 7.5, 15.0];

mixin SnowMixin on ColorRangeMixin {
  Map<double, Color> get snowColorStops => _colorStops;

  List<double> get snowRangeStops => _rangeStops;

  double get snowScaleMinReference => 2.0;

  List<Color> snowColors() => rangeColors(_rangeStops, _colorStops);

  Color snowColor(double mmPerHour) => rangeColor(_colorStops, mmPerHour);
}
