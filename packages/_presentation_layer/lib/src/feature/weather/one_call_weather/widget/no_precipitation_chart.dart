import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../widget/color_range_mixin.dart';
import '../../widget/rain_mixin.dart';
import '../../widget/temperature_mixin.dart';
import 'hourly_chart.dart';

class NoPrecipitationChart extends HourlyChart with ColorRangeMixin, RainMixin, TemperatureMixin {
  const NoPrecipitationChart({
    super.key,
    required super.weather,
    required super.stats,
    super.height,
    super.margin,
    super.padding,
  });

  @override
  Widget? chartTitle(BuildContext context) {
    return Row(
      children: [
        Text('Precipitation ', style: titleStyle(context), textScaleFactor: 1.2),
        Text('(mm/h)', style: titleUnitsStyle(context)),
      ],
    );
  }

  @override
  Widget? chartReplacement(BuildContext context, List<HourlyWeather> data) {
    var lastDryTime = data.last.localShiftedDateTime;
    const hrsToDayEnd = Duration(hours: 23);
    final lastDayEnd = weather.daily.last.localShiftedDateTime.add(hrsToDayEnd);
    if (lastDayEnd.isAfter(lastDryTime)) {
      lastDryTime = lastDayEnd;
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

    late String type;
    if (stats.minTemp.value > 0.5) {
      type = 'rain';
    } else if (stats.maxTemp.value < -0.5) {
      type = 'snow';
    } else {
      type = 'rain or snow';
    }
    final color = temperatureColor(data[0].conditions.temperatures.temperature);
    return Padding(
      padding: EdgeInsets.only(left: padding.left, right: padding.right, top: 10.0, bottom: 20.0),
      child: Text('No $type expected in the next $periodMsg', style: TextStyle(color: color)),
    );
  }

  @override
  List<ChartSeries> series(List<HourlyWeather> data) => [];
}
