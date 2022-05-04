import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';

mixin TemperatureMixin {
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
        startColor: color,
        celcius: celcius,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight);
  }

  Color temperatureColor(Celcius celcius) {
    final temp = celcius.value;
    if (temp < 0) {
      return Color.lerp(Colors.blue[100], Colors.blue[600]!, _rangePercent(temp, 0, -20))!;
    } else if (temp < 10) {
      return Color.lerp(Colors.blue[100]!, Colors.white, _rangePercent(temp, 0, 10))!;
    } else if (temp < 20) {
      return Color.lerp(Colors.yellow[50], Colors.yellow[300]!, _rangePercent(temp, 10, 20))!;
    } else if (temp < 30) {
      return Color.lerp(Colors.yellow[300]!, Colors.orange[900]!, _rangePercent(temp, 20, 30))!;
    } else {
      return Color.lerp(Colors.orange[900]!, Colors.red[900]!, _rangePercent(temp, 30, 40))!;
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
