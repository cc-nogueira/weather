import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../l10n/translations.dart';
import '../../../chart_scale/widget/snow_scale_widget.dart';
import '../../widget/snow_mixin.dart';
import '../helper/one_call_weather_stats.dart';
import 'add_temp_to_snow_chart_switch.dart';
import 'hourly_chart_with_temperature.dart';

class HourlySnowChart extends ConsumerWidget {
  const HourlySnowChart({
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
    return _HourlySnowChart(
      weather: weather,
      stats: stats,
      unit: ref.watch(precipitationUnitProvider),
      tempUnit: ref.watch(temperatureUnitProvider),
      showTemperature: ref.watch(addTempToSnowChartProvider),
      height: height,
      margin: margin,
      padding: padding,
    );
  }
}

class _HourlySnowChart extends HourlyChartWithTemperature<Speed> with SnowMixin {
  const _HourlySnowChart({
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
      Text(translations.snow_chart_title, style: titleStyle(context), textScaleFactor: 1.2),
      Text(' (${unit.symbol})', style: titleUnitsStyle(context)),
      helpButton(context, (_) => const SnowScaleWidget()),
    ]);
  }

  @override
  Widget get addTemperatureSwitch => AddTemperatureToSnowChartSwitch();

  @override
  bool shouldReplaceChart(List<HourlyWeather> data) {
    for (final hourly in data) {
      final snow = hourly.conditions.snow1h;
      if (snow != null && snow > 0.0) {
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
      if (daily.conditions.snow == null || daily.conditions.snow == 0.0) {
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
      msg = translations.no_snow_next_hours(inHours);
    } else {
      msg = translations.no_snow_next_days(dryPeriod.inDays);
    }

    final color = temperatureColor(data[0].conditions.temperatures.temperature);
    return Padding(
      padding: EdgeInsets.only(left: padding.left, right: padding.right, top: 10.0, bottom: 20.0),
      child: Text(msg, style: TextStyle(color: color)),
    );
  }

  @override
  String? get primaryYAxisName => 'snow';

  @override
  double? get primaryYAxisMaximum {
    if (stats.hourlyStats.maxSnow > 0.7 * snowScaleMinReference) return null;
    return _precipitationInChartUnit(snowScaleMinReference.ceilToDouble());
  }

  @override
  ChartLabelFormatterCallback? get primaryYAxisLabelFormatter => (AxisLabelRenderDetails details) {
        late final double value;
        if (unit == Speed().meterPerSecond) {
          value = details.value.toDouble();
        } else {
          value = Quantity(amount: details.value.toDouble(), unit: unit)
              .convertTo(Speed().meterPerSecond)
              .amount;
        }
        return ChartAxisLabel(
          details.text,
          details.textStyle.copyWith(color: snowColor(value)),
        );
      };

  @override
  List<ChartSeries> series(List<HourlyWeather> data) {
    return [
      ColumnSeries<HourlyWeather, DateTime>(
        name: 'Snow',
        dataSource: data,
        xValueMapper: (data, idx) => data.localShiftedDateTime,
        yValueMapper: (data, _) => _precipitationInChartUnit(data.conditions.snow1h ?? 0.0),
        yAxisName: primaryYAxisName,
        pointColorMapper: (hourly, idx) => snowColor(hourly.conditions.snow1h ?? 0.0),
      ),
      if (showTemperature) temperatureSeries(data),
    ];
  }

  double _precipitationInChartUnit(double dataValue) =>
      Speed.millimetersPerHour(dataValue).convertTo(unit).amount;
}
