import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../widget/snow_mixin.dart';
import '../../widget/temperature_mixin.dart';
import '../helper/one_call_weather_stats.dart';
import 'hourly_chart.dart';

class HourlySnowChart extends HourlyChart with SnowMixin, TemperatureMixin {
  const HourlySnowChart({
    Key? key,
    required OneCallWeather weather,
    required OneCallWeatherStats stats,
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

  @override
  Widget? chartTitle(BuildContext context) {
    return Row(
      children: [
        Text('Snow ', style: titleStyle(context), textScaleFactor: 1.2),
        Text('(mm/h)', style: titleUnitsStyle(context)),
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
  List<ColumnSeries> series(List<HourlyWeather> data) {
    return [
      ColumnSeries<HourlyWeather, DateTime>(
        dataSource: data,
        xValueMapper: (data, idx) => data.localShiftedDateTime,
        yValueMapper: (data, _) => data.conditions.snow1h,
        pointColorMapper: (hourly, idx) => snowColor(hourly.conditions.snow1h ?? 0.0),
      ),
    ];
  }

  @override
  double? get primaryYAxisMaximum {
    if (stats.hourlyStats.maxSnow > 0.7) return null;
    return 1.0;
  }

  @override
  ChartLabelFormatterCallback? get primaryYAxisLabelFormatter =>
      (AxisLabelRenderDetails details) => ChartAxisLabel(
            details.text,
            details.textStyle.copyWith(color: snowColor(details.value.toDouble())),
          );
}
