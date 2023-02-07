import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../domain/entity/weather/one_call_weather.dart';
import '../../../../../domain/entity/weather/weather.dart';
import '../../../../../domain/usecase/preferences_usecase.dart';
import '../../../../l10n/translations.dart';
import '../../chart_scale/widget/rain_scale_widget.dart';
import '../../widget/rain_mixin.dart';
import '../helper/one_call_weather_stats.dart';
import 'add_temp_to_rain_chart_switch.dart';
import 'hourly_chart_with_temperature.dart';

class HourlyRainChart extends ConsumerWidget {
  const HourlyRainChart({
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
    return _HourlyRainChart(
      weather: weather,
      stats: stats,
      unit: ref.watch(precipitationUnitProvider),
      tempUnit: ref.watch(temperatureUnitProvider),
      showTemperature: ref.watch(addTempToRainChartProvider),
      height: height,
      margin: margin,
      padding: padding,
    );
  }
}

class _HourlyRainChart extends HourlyChartWithTemperature<Speed> with RainMixin {
  const _HourlyRainChart({
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
      Text(translations.rain_chart_title, style: titleStyle(context), textScaleFactor: 1.2),
      Text(' (${unit.symbol})', style: titleUnitsStyle(context)),
      helpButton(context, (_) => const RainScaleWidget()),
    ]);
  }

  @override
  Widget get addTemperatureSwitch => AddTemperatureToRainChartSwitch();

  @override
  bool shouldReplaceChart(List<HourlyWeather> data) {
    for (final hourly in data) {
      final rain = hourly.conditions.rain1h;
      if (rain != null && rain > 0.0) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget chartReplacement(BuildContext context, List<HourlyWeather> data) {
    final translations = Translations.of(context)!;
    var lastDryTime = data.last.localShiftedDateTime;
    const hrsToDayEnd = Duration(hours: 23);
    for (final daily in weather.daily) {
      if (daily.conditions.rain == null || daily.conditions.rain == 0.0) {
        final dayEnd = daily.localShiftedDateTime.add(hrsToDayEnd);
        if (dayEnd.isAfter(lastDryTime)) {
          lastDryTime = dayEnd;
        }
      } else {
        break;
      }
    }

    late final String msg;
    final dryPeriod = lastDryTime.difference(data[0].localShiftedDateTime);
    final inHours = dryPeriod.inHours;
    if (dryPeriod.inHours < 48) {
      msg = translations.no_rain_next_hours(inHours);
    } else {
      msg = translations.no_rain_next_days(dryPeriod.inDays);
    }

    final color = temperatureColor(data[0].conditions.temperatures.temperature);
    return Padding(
      padding: EdgeInsets.only(left: padding.left, right: padding.right, top: 10.0, bottom: 20.0),
      child: Text(msg, style: TextStyle(color: color)),
    );
  }

  @override
  String? get primaryYAxisName => 'rain';

  @override
  double? get primaryYAxisMaximum {
    if (stats.hourlyStats.maxRain > 0.7 * rainScaleMinReference) return null;
    return _precipitationInChartUnit(rainScaleMinReference.ceilToDouble());
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
          details.textStyle.copyWith(color: rainColor(value)),
        );
      };

  @override
  List<ChartSeries> series(List<HourlyWeather> data) => [
        ColumnSeries<HourlyWeather, DateTime>(
          name: 'Rain',
          dataSource: data,
          xValueMapper: (data, idx) => data.localShiftedDateTime,
          yValueMapper: (data, _) => _precipitationInChartUnit(data.conditions.rain1h ?? 0.0),
          yAxisName: primaryYAxisName,
          pointColorMapper: (hourly, idx) => rainColor(hourly.conditions.rain1h ?? 0.0),
        ),
        if (showTemperature) temperatureSeries(data),
      ];

  double _precipitationInChartUnit(double dataValue) => Speed.millimetersPerHour(dataValue).convertTo(unit).amount;
}
