import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../l10n/translations.dart';
import '../../widget/color_range_mixin.dart';
import '../../widget/temperature_mixin.dart';
import '../../widget/weather_mixin.dart';
import 'chart_widget.dart';

class DailyWeatherChart extends ChartWidget with ColorRangeMixin, TemperatureMixin, WeatherMixin {
  const DailyWeatherChart({
    super.key,
    required this.weather,
    super.margin,
    super.padding,
  }) : super(height: chartHeight);

  static const chartHeight = 140.0;

  final OneCallWeather weather;

  final tempUnitStyle = const TextStyle(
    fontFamily: 'Segoe UI',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    color: Color(0xbeffffff),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(hourMetronomeProvider);
    final unit = ref.watch(temperatureUnitProvider);
    final data = weather.daily;
    final title = _chartTitle(context);
    return DecoratedBox(
      decoration: BoxDecoration(color: backgroundColor),
      child: Padding(
        padding: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Padding(
                padding:
                    EdgeInsets.only(left: padding.left, right: padding.right, top: padding.top),
                child: title,
              ),
            _chart(context, data, unit),
          ],
        ),
      ),
    );
  }

  Widget? _chartTitle(BuildContext context) {
    final translations = Translations.of(context)!;
    return Text(translations.daily_chart_title, style: titleStyle(context), textScaleFactor: 1.2);
  }

  Widget _chart(BuildContext context, List<DailyWeather> data, Unit<Temperature> unit) => SizedBox(
        height: height,
        child: SfCartesianChart(
          series: _series(data, unit),
          margin: padding,
          primaryXAxis: _primaryXAxis(context, data),
          primaryYAxis: _primaryYAxis(context, data),
        ),
      );

  List<XyDataSeries> _series(List<DailyWeather> data, Unit<Temperature> unit) {
    return [
      ScatterSeries<DailyWeather, DateTime>(
        dataSource: data,
        xValueMapper: (data, idx) => data.localShiftedDateTime,
        yValueMapper: (data, idx) => 5.0,
        color: Colors.transparent,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          builder: (dynamic item, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
            final daily = item as DailyWeather;
            final min = daily.conditions.dailyMin.quantity.convertTo(unit).amount.round();
            final max = daily.conditions.dailyMax.quantity.convertTo(unit).amount.round();
            final minTextStyle =
                tempUnitStyle.copyWith(color: temperatureColor(daily.conditions.dailyMin));
            final maxTextStyle =
                tempUnitStyle.copyWith(color: temperatureColor(daily.conditions.dailyMax));
            return SizedBox(
              height: 70,
              width: 30,
              child: Column(
                children: [
                  weatherIcon(daily.conditions.code, size: 32, color: Colors.white),
                  FittedBox(child: Text('$max ${unit.symbol}', style: maxTextStyle)),
                  FittedBox(child: Text('$min ${unit.symbol}', style: minTextStyle)),
                ],
              ),
            );
          },
          labelAlignment: ChartDataLabelAlignment.middle,
        ),
      ),
    ];
  }

  ChartAxis? _primaryXAxis(BuildContext context, List<DailyWeather> data) => DateTimeAxis(
        interval: 1.0,
        desiredIntervals: data.length,
        intervalType: DateTimeIntervalType.days,
        rangePadding: ChartRangePadding.round,
        labelAlignment: LabelAlignment.center,
        autoScrollingMode: AutoScrollingMode.start,
        dateFormat: DateFormat.d(),
      );

  ChartAxis? _primaryYAxis(BuildContext context, List<DailyWeather> data) => NumericAxis(
        isVisible: false,
        minimum: 0.0,
        maximum: 10.0,
        anchorRangeToVisiblePoints: false,
      );
}
