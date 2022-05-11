import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../chart_scale/widget/snow_scale_widget.dart';
import '../../widget/color_range_mixin.dart';
import '../../widget/snow_mixin.dart';
import '../../widget/temperature_mixin.dart';
import '../helper/one_call_weather_stats.dart';
import 'hourly_chart.dart';

class HourlySnowChart extends ConsumerWidget {
  const HourlySnowChart({
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
    return HourlySnowChartChart(
      weather: weather,
      stats: stats,
      unit: ref.watch(precipitationUnitProvider),
      height: height,
      margin: margin,
      padding: padding,
    );
  }
}

class HourlySnowChartChart extends HourlyChart with ColorRangeMixin, SnowMixin, TemperatureMixin {
  const HourlySnowChartChart({
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
        Text('Snow ', style: titleStyle(context), textScaleFactor: 1.2),
        Text('(${unit.symbol})', style: titleUnitsStyle(context)),
        helpButton(context, (_) => const SnowScaleWidget()),
      ],
    );
  }

  @override
  Widget? chartReplacement(BuildContext context, List<HourlyWeather> data) =>
      checkNoSnowInHourlyForecast(data) ? _noSnowMessage(context, data) : null;

  bool checkNoSnowInHourlyForecast(List<HourlyWeather> data) {
    for (final hourly in data) {
      final snow = hourly.conditions.snow1h;
      if (snow != null && snow > 0.0) {
        return false;
      }
    }
    return true;
  }

  Widget _noSnowMessage(BuildContext context, List<HourlyWeather> data) {
    var lastNoSnowTime = data.last.localShiftedDateTime;
    const hrsToDayEnd = Duration(hours: 23);
    for (final daily in weather.daily) {
      if (daily.conditions.snow == null || daily.conditions.snow == 0.0) {
        final dayEnd = daily.localShiftedDateTime.add(hrsToDayEnd);
        if (dayEnd.isAfter(lastNoSnowTime)) {
          lastNoSnowTime = dayEnd;
        }
      } else {
        break;
      }
    }

    late final String periodMsg;
    final noSnowPeriod = lastNoSnowTime.difference(data[0].localShiftedDateTime);
    final inHours = noSnowPeriod.inHours;
    if (noSnowPeriod.inHours < 2) {
      periodMsg = 'hour';
    } else if (inHours < 48) {
      periodMsg = '$inHours hours';
    } else {
      periodMsg = '${noSnowPeriod.inDays} days';
    }

    final color = temperatureColor(data[0].conditions.temperatures.temperature);
    return Padding(
      padding: EdgeInsets.only(left: padding.left, right: padding.right, top: 10.0, bottom: 20.0),
      child: Text('No snow expected in the next $periodMsg', style: TextStyle(color: color)),
    );
  }

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
    ];
  }

  @override
  double? get primaryYAxisMaximum {
    if (stats.hourlyStats.maxSnow > 0.7) return null;
    return _precipitationInChartUnit(1.0);
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

  double _precipitationInChartUnit(double dataValue) =>
      Speed.millimetersPerHour(dataValue).convertTo(unit).amount;
}
