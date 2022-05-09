import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../widget/rain_mixin.dart';
import '../../widget/weather_mixin.dart';
import 'hourly_chart.dart';

class DailyWeatherChart extends HourlyChart with RainMixin, WeatherMixin {
  const DailyWeatherChart({
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
  Widget? chartTitle(BuildContext context) =>
      Text('Hourly Weather', style: titleStyle(context), textScaleFactor: 1.2);

  @override
  double get primaryXAxisInterval => 1.0;

  @override
  int? get autoScrollingDelta => 12;

  @override
  List<XyDataSeries> series(List<HourlyWeather> data) {
    return [
      ColumnSeries<HourlyWeather, DateTime>(
        dataSource: data,
        xValueMapper: (data, _) => data.localShiftedDateTime, // was local
        yValueMapper: (data, _) => data.conditions.rain1h,
        spacing: 0.8,
      ),
      ScatterSeries<HourlyWeather, DateTime>(
        dataSource: data,
        xValueMapper: (data, idx) => data.localShiftedDateTime, // was local
        yValueMapper: (data, idx) => 0.0,
        legendIconType: LegendIconType.image,
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
