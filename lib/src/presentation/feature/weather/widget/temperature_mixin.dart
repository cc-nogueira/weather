import 'package:flutter/material.dart';

import '../../../../domain/entity/weather/celcius.dart';
import 'color_range_mixin.dart';

final _colorStops = <double, Color>{
  -20.0: Colors.blue[600]!,
  0.0: Colors.blue[100]!,
  10.0: Colors.yellow[50]!,
  20.0: Colors.yellow[300]!,
  30.0: Colors.orange[900]!,
  40.0: Colors.red[900]!,
};

mixin TemperatureMixin on ColorRangeMixin {
  Map<double, Color> get temperatureColorStops => _colorStops;

  Color temperatureColor(Celcius celcius) => rangeColor(_colorStops, celcius.value);

  Gradient temperatureGradient({
    required Color startColor,
    required Celcius celcius,
    required Alignment begin,
    required Alignment end,
  }) {
    return LinearGradient(
      colors: [startColor, temperatureColor(celcius)],
      stops: const [0.0, 1.0],
      begin: begin,
      end: end,
    );
  }

  Gradient continuationGradient(Color startColor, Celcius celcius) {
    final color = Color.lerp(startColor, temperatureColor(celcius), 0.1)!;
    return temperatureGradient(
        startColor: color, celcius: celcius, begin: Alignment.centerLeft, end: Alignment.centerRight);
  }
}
