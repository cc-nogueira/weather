import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../widget/rain_mixin.dart';
import '../../widget/temperature_mixin.dart';
import 'hourly_weather_chart.dart';

class RainAndTemperatureChart extends ConsumerWidget {
  const RainAndTemperatureChart({
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
    return _RainAndTemperatureChart(
      weather: weather,
      unit: ref.watch(temperatureUnitProvider),
      height: height,
      margin: margin,
      padding: padding,
      backgroundColor: backgroundColor,
    );
  }
}

class _RainAndTemperatureChart extends HourlyWeatherChart with RainMixin, TemperatureMixin {
  const _RainAndTemperatureChart({
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
    final rainC = rainColor(weather.weather.conditions.rain1h ?? 0);
    final tempC = temperatureColor(weather.weather.conditions.temperatures.temperature);
    return Row(
      children: [
        Text('Rain ', style: titleStyle(context), textScaleFactor: 1.2),
        Text('(mm/h)', style: titleUnitsStyle(context)!.copyWith(color: rainC)),
        Text(' and Temperature ', style: titleStyle(context), textScaleFactor: 1.2),
        Text('(${unit.symbol})', style: titleUnitsStyle(context)!.copyWith(color: tempC)),
      ],
    );
  }

  @override
  String? get primaryYAxisName => 'rain';

  String get _temperatureYAxisName => 'temp';

  @override
  List<ChartAxis> get axes => [
        NumericAxis(
          name: _temperatureYAxisName,
          opposedPosition: true,
          anchorRangeToVisiblePoints: anchorRangeToVisiblePoints,
          rangePadding: ChartRangePadding.additional,
          decimalPlaces: 0,
          labelStyle: TextStyle(color: palette[1]),
          axisLabelFormatter: _temperatureYAxisLabelFormatter,
        ),
      ];

  @override
  List<ChartSeries> series(List<HourlyWeather> data) {
    return [
      ColumnSeries<HourlyWeather, DateTime>(
        name: 'Rain',
        dataSource: data,
        xValueMapper: (data, _) => data.localDateTime,
        yValueMapper: (data, _) => data.conditions.rain1h,
        yAxisName: primaryYAxisName,
        pointColorMapper: (hourly, idx) => rainColor(hourly.conditions.rain1h ?? 0.0),
      ),
      LineSeries<HourlyWeather, DateTime>(
        name: 'Temperature',
        dataSource: data,
        xValueMapper: (data, _) => data.localDateTime, //data.localDateTime.hour,
        yValueMapper: (data, _) => _temperature(data, unit).amount,
        yAxisName: _temperatureYAxisName,
        pointColorMapper: _temperatureColor,
      ),
    ];
  }

  @override
  ChartLabelFormatterCallback? get primaryYAxisLabelFormatter =>
      (AxisLabelRenderDetails details) => ChartAxisLabel(
            details.text,
            details.textStyle.copyWith(color: rainColor(details.value.toDouble())),
          );

  ChartLabelFormatterCallback? get _temperatureYAxisLabelFormatter =>
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
