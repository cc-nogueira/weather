import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../widget/temperature_mixin.dart';
import 'hourly_weather_chart.dart';

class TemperatureChart extends ConsumerWidget {
  const TemperatureChart({
    Key? key,
    required this.weather,
    this.height,
    this.margin,
    this.padding,
    this.backgroundColor,
  }) : super(key: key);

  final OneCallWeather weather;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _TemperatureChart(
      weather: weather,
      unit: ref.watch(temperatureUnitProvider),
      height: height,
      margin: margin,
      padding: padding,
      backgroundColor: backgroundColor,
    );
  }
}

class _TemperatureChart extends HourlyWeatherChart with TemperatureMixin {
  const _TemperatureChart({
    Key? key,
    required OneCallWeather weather,
    required this.unit,
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
            backgroundColor: backgroundColor);

  final Unit<Temperature> unit;

  @override
  Widget? chartTitle(BuildContext context) {
    return Row(
      children: [
        Text('Temperature ', style: titleStyle(context), textScaleFactor: 1.2),
        Text('(${unit.symbol})', style: titleUnitsStyle(context)),
      ],
    );
  }

  @override
  List<LineSeries> series(List<HourlyWeather> data) {
    return [
      LineSeries<HourlyWeather, DateTime>(
        name: 'Temperature',
        dataSource: data,
        pointColorMapper: _temperatureColor,
        dataLabelSettings: const DataLabelSettings(labelAlignment: ChartDataLabelAlignment.middle),
        xValueMapper: (data, idx) => data.localDateTime,
        yValueMapper: (data, _) => _temperature(data, unit).amount,
      ),
    ];
  }

  @override
  ChartRangePadding? get primaryYAxisRangePadding => ChartRangePadding.additional;

  @override
  ChartLabelFormatterCallback? get primaryYAxisLabelFormatter =>
      (AxisLabelRenderDetails details) => ChartAxisLabel(
            details.text,
            details.textStyle.copyWith(color: temperatureColor(Celcius(details.value.toDouble()))),
          );

  Color _temperatureColor(HourlyWeather hourly, int index) =>
      temperatureColor(hourly.conditions.temperatures.temperature);

  Quantity<Temperature> _temperature(HourlyWeather hourly, Unit<Temperature> unit) {
    final celcius = hourly.conditions.temperatures.temperature;
    return celcius.quantity.convertTo(unit);
  }
}
