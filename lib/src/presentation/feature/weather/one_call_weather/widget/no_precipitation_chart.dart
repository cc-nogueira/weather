import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../domain_layer.dart';
import '../../../../l10n/translations.dart';
import '../../widget/color_range_mixin.dart';
import '../../widget/rain_mixin.dart';
import '../../widget/temperature_mixin.dart';
import '../helper/one_call_weather_stats.dart';
import 'hourly_chart.dart';

class NoPrecipitationChart extends ConsumerWidget {
  const NoPrecipitationChart({
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
    return _NoPrecipitationChart(
      weather: weather,
      stats: stats,
      unit: ref.watch(precipitationUnitProvider),
      height: height,
      margin: margin,
      padding: padding,
    );
  }
}

class _NoPrecipitationChart extends HourlyChart with ColorRangeMixin, RainMixin, TemperatureMixin {
  const _NoPrecipitationChart({
    required super.weather,
    required super.stats,
    required this.unit,
    super.height,
    super.margin,
    super.padding,
  });

  final Unit<Speed> unit;

  @override
  Widget? chartTitle(BuildContext context, List<HourlyWeather> data) {
    final translations = Translations.of(context)!;
    return Row(
      children: [
        Text(translations.precipitation_chart_title, style: titleStyle(context), textScaleFactor: 1.2),
        Text(' (${unit.symbol})', style: titleUnitsStyle(context)),
      ],
    );
  }

  @override
  bool shouldReplaceChart(List<HourlyWeather> data) => true;

  @override
  Widget chartReplacement(BuildContext context, List<HourlyWeather> data) {
    final translations = Translations.of(context)!;
    var lastDryTime = data.last.localShiftedDateTime;
    const hrsToDayEnd = Duration(hours: 23);
    final lastDayEnd = weather.daily.last.localShiftedDateTime.add(hrsToDayEnd);
    if (lastDayEnd.isAfter(lastDryTime)) {
      lastDryTime = lastDayEnd;
    }

    late final String msg;
    final dryPeriod = lastDryTime.difference(data[0].localShiftedDateTime);
    final inHours = dryPeriod.inHours;

    if (stats.minTemp.value > 0.5) {
      if (dryPeriod.inHours < 48) {
        msg = translations.no_rain_next_hours(inHours);
      } else {
        msg = translations.no_rain_next_days(dryPeriod.inDays);
      }
    } else if (stats.maxTemp.value < -0.5) {
      if (dryPeriod.inHours < 48) {
        msg = translations.no_snow_next_hours(inHours);
      } else {
        msg = translations.no_snow_next_days(dryPeriod.inDays);
      }
    } else {
      if (dryPeriod.inHours < 48) {
        msg = translations.no_rain_or_snow_next_hours(inHours);
      } else {
        msg = translations.no_rain_or_snow_next_days(dryPeriod.inDays);
      }
    }
    final color = temperatureColor(data[0].conditions.temperatures.temperature);
    return Padding(
      padding: EdgeInsets.only(left: padding.left, right: padding.right, top: 10.0, bottom: 20.0),
      child: Text(msg, style: TextStyle(color: color)),
    );
  }

  @override
  List<ChartSeries> series(List<HourlyWeather> data) => [];
}
