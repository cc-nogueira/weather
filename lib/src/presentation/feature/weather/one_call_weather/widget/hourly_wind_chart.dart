import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tuple/tuple.dart';

import '../../../../../domain/entity/weather/one_call_weather.dart';
import '../../../../../domain/entity/weather/weather.dart';
import '../../../../../domain/entity/weather/wind.dart';
import '../../../../../domain/usecase/preferences_usecase.dart';
import '../../../../l10n/translations.dart';
import '../../chart_scale/widget/wind_scale_widget.dart';
import '../../widget/wind_mixin.dart';
import '../helper/one_call_weather_stats.dart';
import 'add_temp_to_wind_chart_switch.dart';
import 'hourly_chart_with_temperature.dart';

class HourlyWindChart extends ConsumerWidget {
  const HourlyWindChart({
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
    return _HourlyWindChart(
      weather: weather,
      stats: stats,
      unit: ref.watch(windSpeedUnitProvider),
      tempUnit: ref.watch(temperatureUnitProvider),
      showTemperature: ref.watch(addTempToWindChartProvider),
      height: height,
      margin: margin,
      padding: padding,
    );
  }
}

class _HourlyWindChart extends HourlyChartWithTemperature<Speed> with WindMixin {
  const _HourlyWindChart({
    required super.weather,
    required super.stats,
    required super.unit,
    required super.tempUnit,
    required super.showTemperature,
    super.height,
    super.margin,
    super.padding,
  });

  @override
  Widget basicChartTitle(BuildContext context, Translations translations) {
    return Row(children: [
      Text(translations.wind_chart_title, style: titleStyle(context), textScaleFactor: 1.2),
      Text(' (${unit.symbol})', style: titleUnitsStyle(context)),
      helpButton(context, (_) => const WindScaleWidget()),
    ]);
  }

  @override
  Widget get addTemperatureSwitch => AddTemperatureToWindChartSwitch();

  @override
  double? get primaryYAxisMaximum {
    if (stats.hourlyStats.maxWind > 0.7 * windScaleMinReference) return null;
    return _windInChartUnit(windScaleMinReference.ceilToDouble());
  }

  @override
  ChartLabelFormatterCallback? get primaryYAxisLabelFormatter => (AxisLabelRenderDetails details) {
        late final double value;
        if (unit == Speed().meterPerSecond) {
          value = details.value.toDouble();
        } else {
          value = Quantity(amount: details.value.toDouble(), unit: unit).convertTo(Speed().meterPerSecond).amount;
        }
        return ChartAxisLabel(
          details.text,
          details.textStyle.copyWith(color: windColor(Wind(speed: value))),
        );
      };

  @override
  List<XyDataSeries> series(List<HourlyWeather> data) {
    final windRange = _windRangeInChartUnit(data);
    final colorGrad = _windColorGradient(data, windRange);
    final windValue = max(0.8, windRange.item2 / 6.0);

    return [
      SplineAreaSeries<HourlyWeather, DateTime>(
        name: 'WindArea',
        dataSource: data,
        color: palette[0].withOpacity(0.6),
        gradient: colorGrad,
        dataLabelSettings: const DataLabelSettings(labelAlignment: ChartDataLabelAlignment.middle),
        xValueMapper: (item, idx) => item.localShiftedDateTime,
        yValueMapper: (item, _) => _windInChartUnit(item.conditions.wind.speed),
      ),
      SplineSeries<HourlyWeather, DateTime>(
        name: 'Wind',
        dataSource: data,
        pointColorMapper: (HourlyWeather hourly, int index) => windColor(hourly.conditions.wind),
        width: 3.0,
        dataLabelSettings: const DataLabelSettings(labelAlignment: ChartDataLabelAlignment.middle),
        xValueMapper: (item, idx) => item.localShiftedDateTime,
        yValueMapper: (item, _) => _windInChartUnit(item.conditions.wind.speed),
      ),
      ScatterSeries<HourlyWeather, DateTime>(
        dataSource: seriesDataForAxisIntervals(data),
        xValueMapper: (item, idx) => item.localShiftedDateTime,
        yValueMapper: (item, idx) => windValue,
        color: Colors.transparent,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          builder: (dynamic item, dynamic point, dynamic series, int pointIndex, int seriesIndex) =>
              hourlyWindIcon(item.conditions.wind, 20),
          alignment: ChartAlignment.center,
          labelAlignment: ChartDataLabelAlignment.middle,
        ),
      ),
      if (showTemperature) temperatureSeries(data),
    ];
  }

  Tuple2<double, double> _windRangeInChartUnit(List<HourlyWeather> data) {
    if (data.isEmpty) return const Tuple2(0.0, 0.0);
    var minT = _windInChartUnit(data.first.conditions.wind.speed);
    var maxT = minT;
    for (var i = 1; i < data.length; ++i) {
      final value = _windInChartUnit(data[i].conditions.wind.speed);
      minT = min(minT, value);
      maxT = max(maxT, value);
    }
    return Tuple2(minT, maxT);
  }

  double _windInChartUnit(double dataValue) => Speed.metersPerSecond(dataValue).convertTo(unit).amount;

  LinearGradient _windColorGradient(List<HourlyWeather> data, Tuple2<double, double> windRange) {
    final topWind = min(
      15.0,
      Quantity(amount: windRange.item2, unit: unit).convertTo(Speed().meterPerSecond).amount,
    );
    final colors = [Colors.transparent];
    final steps = [0.0];
    if (topWind > 3.0) {
      colors.add(windColor(const Wind(speed: 3.0)));
      steps.add(3.0);
      if (topWind > 6.0) {
        colors.add(windColor(const Wind(speed: 6.0)));
        steps.add(6.0);
        if (topWind > 8.0) {
          colors.add(windColor(const Wind(speed: 8.0)));
          steps.add(8.0);
          if (topWind > 10.0) {
            colors.add(windColor(const Wind(speed: 10.0)));
            steps.add(10.0);
          }
        }
      }
    }
    colors.add(windColor(Wind(speed: topWind)));
    steps.add(topWind);

    final stops = steps.map((e) => e / topWind).toList();
    return LinearGradient(colors: colors, begin: Alignment.bottomCenter, end: Alignment.topCenter, stops: stops);
  }
}
