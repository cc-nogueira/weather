import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../widget/weather_widget_mixin.dart';
import 'hourly_chart.dart';

class HourlyWeatherChart extends HourlyChart with WeatherWidgetMixin {
  const HourlyWeatherChart({
    Key? key,
    required OneCallWeather weather,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Color? backgroundColor,
  }) : super(
          key: key,
          weather: weather,
          height: 120,
          margin: margin,
          padding: padding,
          backgroundColor: backgroundColor,
        );

  @override
  Widget? chartTitle(BuildContext context) =>
      Text('Hourly Weather', style: titleStyle(context), textScaleFactor: 1.2);

  @override
  double get primaryXAxisInterval => 1.0;

  @override
  bool get primaryYAxisIsVisible => false;

  @override
  int? get autoScrollingDelta => 8;

  @override
  List<XyDataSeries> series(List<HourlyWeather> data) {
    return [
      ColumnSeries<HourlyWeather, DateTime>(
        dataSource: data,
        xValueMapper: (data, _) => data.localDateTime,
        yValueMapper: (data, _) => 1.0,
        spacing: 0.05,
      ),
      ScatterSeries<HourlyWeather, DateTime>(
        dataSource: data,
        xValueMapper: (data, idx) => data.localDateTime,
        yValueMapper: (data, idx) => 0.5,
        color: Colors.transparent,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          builder: (dynamic item, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
            final hourly = item as HourlyWeather;
            return SizedBox(
              height: 30,
              width: 30,
              child: hourlyWeatherIcon(hourly, 24),
            );
          },
          labelAlignment: ChartDataLabelAlignment.bottom,
        ),
      ),
    ];
  }
}
