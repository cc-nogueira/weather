import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../l10n/translations.dart';
import '../../../chart_scale/widget/snow_scale_widget.dart';
import '../../../chart_scale/widget/temperature_scale_widget.dart';
import '../../../settings/widget/add_temp_to_snow_chart_switch.dart';
import '../../widget/color_range_mixin.dart';
import '../../widget/snow_mixin.dart';
import '../../widget/temperature_mixin.dart';
import '../helper/one_call_weather_stats.dart';
import 'hourly_chart.dart';

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
    return HourlySnowChartChart(
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

class HourlySnowChartChart extends HourlyChart with ColorRangeMixin, SnowMixin, TemperatureMixin {
  const HourlySnowChartChart({
    super.key,
    required super.weather,
    required super.stats,
    required this.unit,
    required this.tempUnit,
    required this.showTemperature,
    super.height,
    super.margin,
    super.padding,
  });

  final Unit<Speed> unit;
  final Unit<Temperature> tempUnit;
  final bool showTemperature;

  @override
  Widget? chartTitle(BuildContext context, List<HourlyWeather> data) {
    final translations = Translations.of(context)!;
    final tempC = temperatureColor(weather.weather.conditions.temperatures.temperature);
    final showTempTitle = showTemperature && !checkNoSnowInHourlyForecast(data);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(translations.snow_chart_title, style: titleStyle(context), textScaleFactor: 1.2),
            Text(' (${unit.symbol})', style: titleUnitsStyle(context)),
            helpButton(context, (_) => const SnowScaleWidget()),
            if (showTempTitle)
              Text(' ${translations.word_and} ', style: titleStyle(context), textScaleFactor: 1.2),
            if (showTempTitle)
              Text(' (${tempUnit.symbol})',
                  style: titleUnitsStyle(context)!.copyWith(color: tempC)),
            if (showTempTitle) helpButton(context, (_) => const TemperatureScaleWidget()),
          ],
        ),
        if (showTempTitle) const AddTemperatureToSnowChartSwitch(),
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
    final translations = Translations.of(context)!;
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

    late final String msg;
    final noSnowPeriod = lastNoSnowTime.difference(data[0].localShiftedDateTime);
    final inHours = noSnowPeriod.inHours;
    if (noSnowPeriod.inHours < 48) {
      msg = translations.no_snow_next_hours(inHours);
    } else {
      msg = translations.no_snow_next_days(noSnowPeriod.inDays);
    }

    final color = temperatureColor(data[0].conditions.temperatures.temperature);
    return Padding(
      padding: EdgeInsets.only(left: padding.left, right: padding.right, top: 10.0, bottom: 20.0),
      child: Text(msg, style: TextStyle(color: color)),
    );
  }

  ChartLabelFormatterCallback? get _temperatureYAxisLabelFormatter =>
      (AxisLabelRenderDetails details) => ChartAxisLabel(
            details.text,
            details.textStyle.copyWith(color: temperatureColor(Celcius(details.value.toDouble()))),
          );

  Color _temperatureColor(HourlyWeather hourly, int index) =>
      temperatureColor(hourly.conditions.temperatures.temperature);

  @override
  String? get primaryYAxisName => 'rain';

  String get _temperatureYAxisName => 'temp';

  @override
  double? get primaryYAxisMaximum {
    if (stats.hourlyStats.maxSnow > 0.7 * snowScaleMinReference) return null;
    return _precipitationInChartUnit(snowScaleMinReference.ceilToDouble());
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
      if (showTemperature)
        LineSeries<HourlyWeather, DateTime>(
          name: 'Temperature',
          dataSource: data,
          xValueMapper: (data, _) => data.localShiftedDateTime,
          yValueMapper: (data, _) => _temperature(data, tempUnit).amount,
          yAxisName: _temperatureYAxisName,
          pointColorMapper: _temperatureColor,
        ),
    ];
  }

  @override
  List<ChartAxis> get axes => [
        if (showTemperature)
          NumericAxis(
            name: _temperatureYAxisName,
            opposedPosition: true,
            majorGridLines: const MajorGridLines(width: 0),
            anchorRangeToVisiblePoints: anchorRangeToVisiblePoints,
            rangePadding: ChartRangePadding.additional,
            decimalPlaces: 0,
            labelStyle: TextStyle(color: palette[1]),
            axisLabelFormatter: _temperatureYAxisLabelFormatter,
          ),
      ];

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

  Quantity<Temperature> _temperature(HourlyWeather hourly, Unit<Temperature> unit) {
    final celcius = hourly.conditions.temperatures.temperature;
    return celcius.quantity.convertTo(unit);
  }
}
