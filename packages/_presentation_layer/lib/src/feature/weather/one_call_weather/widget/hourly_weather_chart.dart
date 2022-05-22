import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../widget/weather_mixin.dart';
import 'hourly_chart.dart';

class HourlyWeatherChart extends HourlyChart with WeatherMixin {
  const HourlyWeatherChart({
    super.key,
    required super.weather,
    required super.stats,
    super.margin,
    super.padding,
  }) : super(height: 120);

  @override
  Widget? chartTitle(BuildContext context, List<HourlyWeather> data) =>
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
        xValueMapper: (data, _) => data.localShiftedDateTime,
        yValueMapper: (data, _) => 1.0,
        spacing: 0.05,
      ),
      ScatterSeries<HourlyWeather, DateTime>(
        dataSource: data,
        xValueMapper: (data, idx) => data.localShiftedDateTime,
        yValueMapper: (data, idx) => 0.5,
        color: Colors.transparent,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          builder: (dynamic item, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
            final hourly = item as HourlyWeather;
            return SizedBox(
              height: 30,
              width: 30,
              child: hourlyWeatherIcon(hourly, size: 24, color: Colors.white),
            );
          },
          labelAlignment: ChartDataLabelAlignment.bottom,
        ),
      ),
    ];
  }
}
