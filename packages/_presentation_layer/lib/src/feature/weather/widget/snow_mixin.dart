import 'package:flutter/material.dart';

mixin SnowMixin {
  Color snowColor(double mmPerHour) {
    if (mmPerHour < 1.0) {
      return Color.lerp(Colors.blue[100], Colors.blue[600]!, _rangePercent(mmPerHour, 0, 1.0))!;
    } else if (mmPerHour < 2.5) {
      return Color.lerp(Colors.blue[600]!, Colors.blue[900]!, _rangePercent(mmPerHour, 1.0, 2.5))!;
    } else if (mmPerHour < 5.0) {
      return Color.lerp(
          Colors.yellow[300]!, Colors.orange[900]!, _rangePercent(mmPerHour, 2.5, 5.0))!;
    } else {
      return Color.lerp(
          Colors.orange[900]!, Colors.red[900]!, _rangePercent(mmPerHour, 5.0, 10.0))!;
    }
  }

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
