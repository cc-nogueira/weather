import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../widget/rain_mixin.dart';
import '../../widget/temperature_mixin.dart';
import '../helper/one_call_weather_stats.dart';
import 'hourly_chart.dart';

class HourlyRainChart extends HourlyChart with RainMixin, TemperatureMixin {
  const HourlyRainChart({
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
        Text('Rain ', style: titleStyle(context), textScaleFactor: 1.2),
        Text('(mm/h)', style: titleUnitsStyle(context)),
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
  List<ColumnSeries> series(List<HourlyWeather> data) {
    return [
      ColumnSeries<HourlyWeather, DateTime>(
        dataSource: data,
        xValueMapper: (data, idx) => data.localShiftedDateTime,
        yValueMapper: (data, _) => data.conditions.rain1h,
        pointColorMapper: (hourly, idx) => rainColor(hourly.conditions.rain1h ?? 0.0),
      ),
    ];
  }

  @override
  double? get primaryYAxisMaximum {
    if (stats.hourlyStats.maxRain > 1.5) return null;
    return 2.0;
  }

  @override
  ChartLabelFormatterCallback? get primaryYAxisLabelFormatter =>
      (AxisLabelRenderDetails details) => ChartAxisLabel(
            details.text,
            details.textStyle.copyWith(color: rainColor(details.value.toDouble())),
          );
}
