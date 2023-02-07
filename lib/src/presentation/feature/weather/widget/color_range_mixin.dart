import 'package:flutter/material.dart';

mixin ColorRangeMixin {
  Color rangeColor(Map<double, Color> colorStops, double value) {
    final keys = colorStops.keys;
    var start = keys.first;
    var end = keys.last;
    for (final key in keys) {
      if (value < key) {
        end = key;
        break;
      }
      start = key;
    }
    return Color.lerp(colorStops[start], colorStops[end], rangePercent(value, start, end))!;
  }

  List<Color> rangeColors(List<double> rangeStops, Map<double, Color> colorStops) {
    final colors = <Color>[];
    for (int i = 1; i < rangeStops.length; ++i) {
      final start = rangeStops[i - 1];
      final end = rangeStops[i];
      colors.add(rangeColor(colorStops, (start + end) / 2.0));
    }
    return colors;
  }

  double rangePercent(double value, double start, double end) {
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
