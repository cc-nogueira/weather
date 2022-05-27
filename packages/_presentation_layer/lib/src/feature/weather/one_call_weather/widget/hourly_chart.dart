import 'dart:math';

import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tuple/tuple.dart';

import '../helper/one_call_weather_stats.dart';
import 'chart_widget.dart';

abstract class HourlyChart extends ChartWidget {
  const HourlyChart({
    super.key,
    required this.weather,
    required this.stats,
    super.height,
    super.margin,
    super.padding,
  });

  final OneCallWeather weather;
  final OneCallWeatherStats stats;

  final palette = const <Color>[
    Color.fromRGBO(75, 135, 185, 1),
    Color.fromRGBO(255, 76, 96, 1),
    Color.fromRGBO(246, 114, 128, 1),
    Color.fromRGBO(248, 177, 149, 1),
    Color.fromRGBO(116, 180, 155, 1),
    Color.fromRGBO(0, 168, 181, 1),
    Color.fromRGBO(73, 76, 162, 1),
    Color.fromRGBO(255, 205, 96, 1),
    Color.fromRGBO(255, 240, 219, 1),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(hourMetronomeProvider);
    final data = seriesData;
    final title = chartTitle(context, data);
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
            shouldReplaceChart(data)
                ? chartReplacement(context, data)
                : LayoutBuilder(
                    builder: (context, constraints) => chart(context, constraints, data)),
          ],
        ),
      ),
    );
  }

  Widget? chartTitle(BuildContext context, List<HourlyWeather> data) => null;

  Widget chart(BuildContext context, BoxConstraints constraints, List<HourlyWeather> data) =>
      SizedBox(
        height: height,
        child: SfCartesianChart(
          series: series(data),
          margin: padding,
          palette: palette,
          primaryXAxis: primaryXAxis(context, constraints, data),
          primaryYAxis: primaryYAxis(context, data),
          axes: axes,
          zoomPanBehavior: ZoomPanBehavior(
            enablePanning: true,
            zoomMode: ZoomMode.x,
          ),
        ),
      );

  bool shouldReplaceChart(List<HourlyWeather> data) => false;

  Widget chartReplacement(BuildContext context, List<HourlyWeather> data) => Container();

  List<ChartSeries> series(List<HourlyWeather> data);

  List<ChartAxis> get axes => [];

  ChartAxis? primaryYAxis(BuildContext context, List<HourlyWeather> data) => NumericAxis(
        isVisible: primaryYAxisIsVisible,
        name: primaryYAxisName,
        anchorRangeToVisiblePoints: anchorRangeToVisiblePoints,
        rangePadding: primaryYAxisRangePadding,
        axisLabelFormatter: primaryYAxisLabelFormatter,
        minimum: primaryYAxisMinimum,
        maximum: primaryYAxisMaximum,
      );

  bool get anchorRangeToVisiblePoints => false;

  bool get primaryYAxisIsVisible => true;

  String? get primaryYAxisName => null;

  ChartRangePadding? get primaryYAxisRangePadding => null;

  ChartLabelFormatterCallback? get primaryYAxisLabelFormatter => null;

  double? get primaryYAxisMinimum => null;

  double? get primaryYAxisMaximum => null;

  ChartAxis? primaryXAxis(
          BuildContext context, BoxConstraints constraints, List<HourlyWeather> data) =>
      DateTimeAxis(
        interval: primaryXAxisInterval,
        desiredIntervals: desiredIntervals(constraints),
        intervalType: DateTimeIntervalType.hours,
        plotBands: plotBands(data),
        multiLevelLabels: multiLevelLabels(context, data),
        multiLevelLabelStyle: multiLevelLabelStyle,
        autoScrollingMode: AutoScrollingMode.start,
        autoScrollingDelta: autoScrollingDelta(constraints),
        axisLabelFormatter: axisLabelFormatter,
        enableAutoIntervalOnZooming: false,
      );

  ChartLabelFormatterCallback? get axisLabelFormatter =>
      (AxisLabelRenderDetails axisLabelRenderArgs) {
        final dt = DateTime.fromMillisecondsSinceEpoch(axisLabelRenderArgs.value.toInt());
        if (dt.hour % 3 != 0) {
          return ChartAxisLabel('', null);
        }
        return ChartAxisLabel(axisLabelRenderArgs.text, null);
      };

  double get primaryXAxisInterval => 3.0;

  bool get hasRightAxes => false;

  int? desiredIntervals(BoxConstraints constraints) {
    print('Constraints: $constraints');
    final axesPadding = 20 + (hasRightAxes ? 20 : 0);
    final graphWidth = constraints.maxWidth - axesPadding;
    if (graphWidth < 440) {
      return 8;
    }
    return min((graphWidth / 55).floor(), 16);
  }

  int? autoScrollingDelta(BoxConstraints constraints) {
    final intervals = desiredIntervals(constraints);
    if (intervals == null) return null;
    return (intervals * primaryXAxisInterval).round();
  }

  MultiLevelLabelStyle get multiLevelLabelStyle =>
      const MultiLevelLabelStyle(borderType: MultiLevelBorderType.rectangle);

  List<PlotBand>? plotBands(List<HourlyWeather> data) {
    final bands = <PlotBand>[];
    if (data.isNotEmpty) {
      late DateTime end;
      var start = data.first.localShiftedDateTime;
      for (final hourly in data) {
        end = hourly.localShiftedDateTime;
        if (end.day != start.day) {
          _addBand(bands, start: start, end: end);
          start = end;
        }
      }
      _addBand(bands, start: start, end: end);
    }
    return bands;
  }

  void _addBand(
    List<PlotBand> bands, {
    required DateTime start,
    required DateTime end,
  }) {
    bands.add(PlotBand(
      start: start,
      end: end,
      color: Colors.lightGreen[700]!,
      opacity: bands.length.isEven ? 0.0 : 0.1,
    ));
  }

  List<DateTimeMultiLevelLabel>? multiLevelLabels(BuildContext context, List<HourlyWeather> data) {
    final dowFormat = DateFormat('EEEE', Localizations.localeOf(context).languageCode);
    final labels = <DateTimeMultiLevelLabel>[];
    if (data.isNotEmpty) {
      late DateTime end;
      var start = data.first.localShiftedDateTime;
      var label = dowFormat.format(start);
      for (final hourly in data) {
        end = hourly.localShiftedDateTime;
        if (end.day != start.day) {
          labels.add(DateTimeMultiLevelLabel(start: start, end: end, text: label));
          start = end;
          label = dowFormat.format(start);
        }
      }
      labels.add(DateTimeMultiLevelLabel(start: start, end: end, text: label));
    }
    return labels;
  }

  List<HourlyWeather> get seriesData {
    final currentHour = _truncatedToHour(DateTime.now()).toUtc();
    final hourly = weather.hourly;
    late int i;
    for (i = 0; i < hourly.length; ++i) {
      if (hourly[i].utcDateTime.compareTo(currentHour) >= 0) {
        break;
      }
    }
    if (i == hourly.length) return [];
    return weather.hourly.sublist(i);
  }

  List<HourlyWeather> seriesDataForAxisIntervals(List<HourlyWeather> data) {
    final intervalsData = <HourlyWeather>[];
    final interval = primaryXAxisInterval.toInt();
    for (var i = 0; i < data.length; ++i) {
      if (data[i].utcDateTime.hour % interval == 0) {
        intervalsData.add(data[i]);
      }
    }
    return intervalsData;
  }

  DateTime _truncatedToHour(DateTime dt) => DateTime(dt.year, dt.month, dt.day, dt.hour);

  Tuple2<double, double> guessYAxisRange(double start, double end) {
    final interval = guessYAxisInterval(start, end);
    var minimum = ((start / interval).floor()) * interval;
    var maximum = ((end / interval).ceil()) * interval;
    if (primaryYAxisRangePadding == ChartRangePadding.additional) {
      minimum -= interval;
      maximum += interval;
    }
    return Tuple2(minimum, maximum);
  }

  double guessYAxisInterval(double start, double end) {
    final range = end - start;
    if (range < 0.01) {
      return range / 4;
    }
    if (range > 4) {
      return (range / 4).floorToDouble();
    }
    return guessYAxisInterval(start * 10, end * 10) / 10.0;
  }
}
