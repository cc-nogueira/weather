import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../chart_scale/widget/rain_scale_widget.dart';
import '../../widget/color_range_mixin.dart';
import '../../widget/rain_mixin.dart';
import '../../widget/temperature_mixin.dart';
import '../helper/one_call_weather_stats.dart';
import 'hourly_chart.dart';

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
    return HourlyRainChartChart(
      weather: weather,
      stats: stats,
      unit: ref.watch(precipitationUnitProvider),
      height: height,
      margin: margin,
      padding: padding,
    );
  }
}

class HourlyRainChartChart extends HourlyChart with ColorRangeMixin, RainMixin, TemperatureMixin {
  const HourlyRainChartChart({
    super.key,
    required super.weather,
    required super.stats,
    required this.unit,
    super.height,
    super.margin,
    super.padding,
  });

  final Unit<Speed> unit;

  @override
  Widget? chartTitle(BuildContext context) {
    return Row(
      children: [
        Text('Rain ', style: titleStyle(context), textScaleFactor: 1.2),
        Text('(${unit.symbol})', style: titleUnitsStyle(context)),
        helpButton(context, (_) => const RainScaleWidget()),
      ],
    );
  }

  @override
  Widget? chartReplacement(BuildContext context, List<HourlyWeather> data) =>
      checkNoRainInHourlyForecast(data) ? _noRainMessage(context, data) : null;

  bool checkNoRainInHourlyForecast(List<HourlyWeather> data) {
    for (final hourly in data) {
      final rain = hourly.conditions.rain1h;
      if (rain != null && rain > 0.0) {
        return false;
      }
    }
    return true;
  }

  Widget _noRainMessage(BuildContext context, List<HourlyWeather> data) {
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

    late final String periodMsg;
    final dryPeriod = lastDryTime.difference(data[0].localShiftedDateTime);
    final inHours = dryPeriod.inHours;
    if (dryPeriod.inHours < 2) {
      periodMsg = 'hour';
    } else if (inHours < 48) {
      periodMsg = '$inHours hours';
    } else {
      periodMsg = '${dryPeriod.inDays} days';
    }

    final color = temperatureColor(data[0].conditions.temperatures.temperature);
    return Padding(
      padding: EdgeInsets.only(left: padding.left, right: padding.right, top: 10.0, bottom: 20.0),
      child: Text('No rain expected in the next $periodMsg', style: TextStyle(color: color)),
    );
  }

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
      ];

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
          value = Quantity(amount: details.value.toDouble(), unit: unit)
              .convertTo(Speed().meterPerSecond)
              .amount;
        }
        return ChartAxisLabel(
          details.text,
          details.textStyle.copyWith(color: rainColor(value)),
        );
      };

  double _precipitationInChartUnit(double dataValue) =>
      Speed.millimetersPerHour(dataValue).convertTo(unit).amount;
}
