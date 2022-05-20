import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../l10n/translations.dart';
import '../../../chart_scale/widget/snow_scale_widget.dart';
import '../helper/one_call_weather_stats.dart';
import 'hourly_snow_chart.dart';

class HourlySnowAndTemperatureChart extends ConsumerWidget {
  const HourlySnowAndTemperatureChart({
    super.key,
    required this.weather,
    required this.stats,
    this.height,
    this.margin,
    this.padding,
    this.backgroundColor,
  });

  final OneCallWeather weather;
  final OneCallWeatherStats stats;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _HourlySnowAndTemperatureChart(
      weather: weather,
      stats: stats,
      unit: ref.watch(precipitationUnitProvider),
      tempUnit: ref.watch(temperatureUnitProvider),
      height: height,
      margin: margin,
      padding: padding,
    );
  }
}

class _HourlySnowAndTemperatureChart extends HourlySnowChartChart {
  const _HourlySnowAndTemperatureChart({
    required super.weather,
    required super.stats,
    required super.unit,
    required this.tempUnit,
    super.height,
    super.margin,
    super.padding,
  });

  final Unit<Temperature> tempUnit;

  @override
  Widget? chartTitle(BuildContext context) {
    final translations = Translations.of(context)!;
    final snowC = snowColor(weather.weather.conditions.snow1h ?? 0);
    final tempC = temperatureColor(weather.weather.conditions.temperatures.temperature);
    return Row(
      children: [
        Text(translations.snow_chart_title, style: titleStyle(context), textScaleFactor: 1.2),
        Text(' (${unit.symbol})', style: titleUnitsStyle(context)!.copyWith(color: snowC)),
        Text(' and ', style: titleStyle(context), textScaleFactor: 1.2),
        Text(translations.temp_chart_title, style: titleStyle(context), textScaleFactor: 1.2),
        Text(' (${tempUnit.symbol})', style: titleUnitsStyle(context)!.copyWith(color: tempC)),
        helpButton(context, (_) => const SnowScaleWidget()),
      ],
    );
  }

  @override
  String? get primaryYAxisName => 'snow';

  String get _temperatureYAxisName => 'temp';

  @override
  List<ChartAxis> get axes => [
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

  @override
  List<ChartSeries> series(List<HourlyWeather> data) {
    return super.series(data)
      ..add(
        LineSeries<HourlyWeather, DateTime>(
          name: 'Temperature',
          dataSource: data,
          xValueMapper: (data, _) => data.localShiftedDateTime,
          yValueMapper: (data, _) => _temperature(data, tempUnit).amount,
          yAxisName: _temperatureYAxisName,
          pointColorMapper: _temperatureColor,
        ),
      );
  }

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
