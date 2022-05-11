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
    Key? key,
    required this.weather,
    required this.stats,
    this.height,
    this.margin,
    this.padding,
  }) : super(key: key);

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
      height: height,
      margin: margin,
      padding: padding,
    );
  }
}

class _HourlyRainChart extends HourlyChart with ColorRangeMixin, RainMixin, TemperatureMixin {
  const _HourlyRainChart({
    Key? key,
    required OneCallWeather weather,
    required OneCallWeatherStats stats,
    required this.unit,
    double? height,
    EdgeInsets? margin,
    EdgeInsets? padding,
  }) : super(
          key: key,
          weather: weather,
          stats: stats,
          height: height,
          margin: margin,
          padding: padding,
        );

  final Unit<Speed> unit;

  @override
  Widget? chartTitle(BuildContext context) {
    return Row(
      children: [
        Text('Rain ', style: titleStyle(context), textScaleFactor: 1.2),
        Text('(${unit.symbol})', style: titleUnitsStyle(context)),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: InkWell(
            child: const Icon(Icons.help, size: 20),
            onTap: () {
              showGeneralDialog(
                context: context,
                barrierColor: const Color(0x80FFFFFF),
                barrierLabel: 'Label',
                barrierDismissible: true,
                transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (_, __, ___) => const RainScaleWidget(),
              );
            },
          ),
        ),
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
  List<ColumnSeries> series(List<HourlyWeather> data) => [
        ColumnSeries<HourlyWeather, DateTime>(
          dataSource: data,
          xValueMapper: (data, idx) => data.localShiftedDateTime,
          yValueMapper: (data, _) => _precipitationInChartUnit(data.conditions.rain1h ?? 0.0),
          pointColorMapper: (hourly, idx) => rainColor(hourly.conditions.rain1h ?? 0.0),
        ),
      ];

  @override
  double? get primaryYAxisMaximum {
    if (stats.hourlyStats.maxRain > 1.5) return null;
    return _precipitationInChartUnit(2.0);
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
