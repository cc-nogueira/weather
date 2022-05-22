import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../l10n/translations.dart';
import '../../../chart_scale/widget/temperature_scale_widget.dart';
import '../../widget/color_range_mixin.dart';
import '../../widget/temperature_mixin.dart';
import '../../widget/weather_mixin.dart';
import '../helper/one_call_weather_stats.dart';
import 'hourly_chart.dart';

class HourlyTemperatureChart extends ConsumerWidget {
  const HourlyTemperatureChart({
    super.key,
    required this.weather,
    required this.stats,
    this.height,
    this.margin,
    this.padding,
  });

  final OneCallWeather weather;
  final OneCallWeatherStats stats;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _HourlyTemperatureChart(
      weather: weather,
      stats: stats,
      unit: ref.watch(temperatureUnitProvider),
      height: height,
      margin: margin,
      padding: padding,
    );
  }
}

class _HourlyTemperatureChart extends HourlyChart
    with ColorRangeMixin, TemperatureMixin, WeatherMixin {
  const _HourlyTemperatureChart({
    required super.weather,
    required super.stats,
    required this.unit,
    super.height,
    super.margin,
    super.padding,
  });

  final Unit<Temperature> unit;

  @override
  Widget? chartTitle(BuildContext context, List<HourlyWeather> data) {
    final translations = Translations.of(context)!;
    return Row(
      children: [
        Text(translations.temp_chart_title, style: titleStyle(context), textScaleFactor: 1.2),
        Text(' (${unit.symbol})', style: titleUnitsStyle(context)),
        helpButton(context, (_) => const TemperatureScaleWidget())
      ],
    );
  }

  @override
  List<XyDataSeries> series(List<HourlyWeather> data) {
    final weatherYValue = stats.hourlyStats.minTemp.quantity.convertTo(unit).amount;
    return [
      LineSeries<HourlyWeather, DateTime>(
        name: 'Temperature',
        dataSource: data,
        pointColorMapper: _hourlyTemperatureColor,
        dataLabelSettings: const DataLabelSettings(labelAlignment: ChartDataLabelAlignment.middle),
        xValueMapper: (item, idx) => item.localShiftedDateTime,
        yValueMapper: (item, _) => _temperature(item).amount,
      ),
      ScatterSeries<HourlyWeather, DateTime>(
        dataSource: seriesDataForAxisIntervals(data),
        xValueMapper: (item, idx) => item.localShiftedDateTime,
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
        final celciusUnit = Temperature().celcius;
        late final double amountInCelcius;
        if (unit == celciusUnit) {
          amountInCelcius = details.value.toDouble();
        } else {
          amountInCelcius =
              Quantity(amount: details.value.toDouble(), unit: unit).convertTo(celciusUnit).amount;
        }
        return ChartAxisLabel(
          details.text,
          details.textStyle.copyWith(color: temperatureColor(Celcius(amountInCelcius))),
        );
      };

  Color _hourlyTemperatureColor(HourlyWeather hourly, int index) =>
      temperatureColor(hourly.conditions.temperatures.temperature);

  Quantity<Temperature> _temperature(HourlyWeather hourly) {
    final celcius = hourly.conditions.temperatures.temperature;
    return celcius.quantity.convertTo(unit);
  }
}
