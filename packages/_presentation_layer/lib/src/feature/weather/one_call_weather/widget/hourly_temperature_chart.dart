import 'dart:math';

import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tuple/tuple.dart';

import '../../widget/temperature_mixin.dart';
import '../../widget/weather_mixin.dart';
import 'hourly_chart.dart';

class HourlyTemperatureChart extends ConsumerWidget {
  const HourlyTemperatureChart({
    Key? key,
    required this.weather,
    this.height,
    this.margin,
    this.padding,
  }) : super(key: key);

  final OneCallWeather weather;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(hourMetronomeProvider);
    return _HourlyTemperatureChart(
      weather: weather,
      unit: ref.watch(temperatureUnitProvider),
      height: height,
      margin: margin,
      padding: padding,
    );
  }
}

class _HourlyTemperatureChart extends HourlyChart with TemperatureMixin, WeatherMixin {
  const _HourlyTemperatureChart({
    Key? key,
    required OneCallWeather weather,
    required this.unit,
    double? height,
    EdgeInsets? margin,
    EdgeInsets? padding,
  }) : super(
          key: key,
          weather: weather,
          height: height,
          margin: margin,
          padding: padding,
        );

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
  List<XyDataSeries> series(List<HourlyWeather> data) {
    final tempRange = _temperatureRange(data);
    final weatherYValue = tempRange.item1;
    return [
      LineSeries<HourlyWeather, DateTime>(
        name: 'Temperature',
        dataSource: data,
        pointColorMapper: _temperatureColor,
        dataLabelSettings: const DataLabelSettings(labelAlignment: ChartDataLabelAlignment.middle),
        xValueMapper: (item, idx) => item.localShiftedDateTime, // was local
        yValueMapper: (item, _) => _temperature(item).amount,
      ),
      ScatterSeries<HourlyWeather, DateTime>(
        dataSource: seriesDataForAxisIntervals(data),
        xValueMapper: (item, idx) => item.localShiftedDateTime, // was local
        yValueMapper: (item, idx) => weatherYValue,
        color: Colors.transparent,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          overflowMode: OverflowMode.hide,
          labelIntersectAction: LabelIntersectAction.hide,
          labelAlignment: ChartDataLabelAlignment.middle,
          builder: (dynamic item, dynamic point, dynamic series, int pointIndex, int seriesIndex) =>
              _hourlyWeatherIcon(item as HourlyWeather),
        ),
      ),
    ];
  }

  Widget _hourlyWeatherIcon(HourlyWeather hourly) => SizedOverflowBox(
        alignment: Alignment.topCenter,
        size: const Size(25, 25),
        child: SizedBox(
          width: 25,
          height: 40,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: hourlyWeatherIcon(
              hourly,
              size: 26,
              color: temperatureColor(hourly.conditions.temperatures.temperature),
            ),
          ),
        ),
      );

  @override
  ChartRangePadding? get primaryYAxisRangePadding => ChartRangePadding.additional;

  @override
  ChartLabelFormatterCallback? get primaryYAxisLabelFormatter => (AxisLabelRenderDetails details) {
        late final double amountInCelcius;
        if (unit == Temperature().celcius) {
          amountInCelcius = details.value.toDouble();
        } else {
          amountInCelcius = Quantity(amount: details.value.toDouble(), unit: unit)
              .convertTo(Temperature().celcius)
              .amount;
        }
        return ChartAxisLabel(
          details.text,
          details.textStyle.copyWith(color: temperatureColor(Celcius(amountInCelcius))),
        );
      };

  Color _temperatureColor(HourlyWeather hourly, int index) =>
      temperatureColor(hourly.conditions.temperatures.temperature);

  Quantity<Temperature> _temperature(HourlyWeather hourly) {
    final celcius = hourly.conditions.temperatures.temperature;
    return celcius.quantity.convertTo(unit);
  }

  Tuple2<double, double> _temperatureRange(List<HourlyWeather> data) {
    if (data.isEmpty) return const Tuple2(0.0, 0.0);
    var minT = _temperature(data[0]).amount;
    var maxT = minT;
    for (var i = 1; i < data.length; ++i) {
      final value = _temperature(data[i]).amount;
      minT = min(minT, value);
      maxT = max(maxT, value);
    }
    return Tuple2(minT, maxT);
  }
}
