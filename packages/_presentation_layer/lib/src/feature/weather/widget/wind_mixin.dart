import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';

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
