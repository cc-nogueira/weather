import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../widget/rain_mixin.dart';
import 'hourly_weather_chart.dart';

class RainChart extends HourlyWeatherChart with RainMixin {
  const RainChart({
    Key? key,
    required OneCallWeather weather,
    double? height,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Color? backgroundColor,
  }) : super(
          key: key,
          weather: weather,
          height: height,
          margin: margin,
          padding: padding,
          backgroundColor: backgroundColor,
        );

  @override
  Widget? chartTitle(BuildContext context) {
    return Row(
      children: [
        Text('Precipitation ', style: titleStyle(context), textScaleFactor: 1.2),
        Text('(mm/h)', style: titleUnitsStyle(context)),
      ],
    );
  }

  @override
  List<ColumnSeries> series(List<HourlyWeather> data) {
    return [
      ColumnSeries<HourlyWeather, DateTime>(
        dataSource: data,
        xValueMapper: (data, idx) => data.localDateTime,
        yValueMapper: (data, _) => data.conditions.rain1h,
        pointColorMapper: (hourly, idx) => rainColor(hourly.conditions.rain1h ?? 0.0),
      ),
    ];
  }

  @override
  ChartLabelFormatterCallback? get primaryYAxisLabelFormatter =>
      (AxisLabelRenderDetails details) => ChartAxisLabel(
            details.text,
            details.textStyle.copyWith(color: rainColor(details.value.toDouble())),
          );
}
