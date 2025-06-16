import 'package:flutter/material.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../domain_layer.dart';
import '../../../../l10n/translations.dart';
import '../../chart_scale/widget/temperature_scale_widget.dart';
import '../../widget/color_range_mixin.dart';
import '../../widget/temperature_mixin.dart';
import 'hourly_chart.dart';

abstract class HourlyChartWithTemperature<T extends PhysicalProperty<T>> extends HourlyChart
    with ColorRangeMixin, TemperatureMixin {
  const HourlyChartWithTemperature({
    super.key,
    required super.weather,
    required super.stats,
    required this.unit,
    required this.tempUnit,
    required this.showTemperature,
    super.height,
    super.margin,
    super.padding,
  });

  final Unit<T> unit;
  final Unit<Temperature> tempUnit;
  final bool showTemperature;

  @override
  Widget? chartTitle(BuildContext context, List<HourlyWeather> data) {
    final translations = Translations.of(context)!;
    final tempC = temperatureColor(weather.weather.conditions.temperatures.temperature);
    final hasChart = !shouldReplaceChart(data);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            basicChartTitle(context, translations),
            if (showTemperature && hasChart)
              Text(' ${translations.word_and} ', style: titleStyle(context), textScaler: TextScaler.linear(1.2)),
            if (showTemperature && hasChart)
              Text(' (${tempUnit.symbol})', style: titleUnitsStyle(context)!.copyWith(color: tempC)),
            if (showTemperature && hasChart) helpButton(context, (_) => const TemperatureScaleWidget()),
          ],
        ),
        if (hasChart) addTemperatureSwitch,
      ],
    );
  }

  Widget basicChartTitle(BuildContext context, Translations translations);

  Widget get addTemperatureSwitch;

  String get _temperatureYAxisName => 'temp';

  @override
  bool get hasRightAxes => showTemperature;

  @override
  List<ChartAxis> get axes => [
    if (showTemperature)
      NumericAxis(
        name: _temperatureYAxisName,
        opposedPosition: true,
        majorGridLines: const MajorGridLines(width: 0),
        anchorRangeToVisiblePoints: anchorRangeToVisiblePoints,
        rangePadding: ChartRangePadding.additional,
        decimalPlaces: 0,
        labelStyle: TextStyle(color: palette[1]),
        axisLabelFormatter: _temperatureYAxisLabelFormatter,
      ),
  ];

  ChartLabelFormatterCallback? get _temperatureYAxisLabelFormatter =>
      (AxisLabelRenderDetails details) => ChartAxisLabel(
        details.text,
        details.textStyle.copyWith(color: temperatureColor(Celcius(details.value.toDouble()))),
      );

  LineSeries<HourlyWeather, DateTime> temperatureSeries(List<HourlyWeather> data) =>
      LineSeries<HourlyWeather, DateTime>(
        name: 'Temperature',
        dataSource: data,
        xValueMapper: (data, _) => data.localShiftedDateTime,
        yValueMapper: (data, _) => _hourlyTemperature(data, tempUnit).amount,
        yAxisName: _temperatureYAxisName,
        pointColorMapper: _hourlyTemperatureColor,
      );

  Quantity<Temperature> _hourlyTemperature(HourlyWeather hourly, Unit<Temperature> unit) {
    final celcius = hourly.conditions.temperatures.temperature;
    return celcius.quantity.convertTo(unit);
  }

  Color _hourlyTemperatureColor(HourlyWeather hourly, int index) =>
      temperatureColor(hourly.conditions.temperatures.temperature);
}
