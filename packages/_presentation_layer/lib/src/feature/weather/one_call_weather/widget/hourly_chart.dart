import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tuple/tuple.dart';

abstract class _ChartWidget extends ConsumerWidget {
  const _ChartWidget({
    Key? key,
    double? height,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Color? backgroundColor,
  })  : height = height ?? 200,
        margin = const EdgeInsets.symmetric(vertical: 4.0),
        padding = const EdgeInsets.all(10.0),
        backgroundColor = Colors.black87,
        super(key: key);

  final double height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = chartTitle(context);
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
            chart(context),
          ],
        ),
      ),
    );
  }

  Widget chart(BuildContext context);

  Widget? chartTitle(BuildContext context) => null;

  TextStyle? titleStyle(BuildContext context) => const TextStyle(
        fontSize: 15.0,
        fontFamily: 'Segoe UI',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
      );

  TextStyle? titleUnitsStyle(BuildContext context) => const TextStyle(
        fontSize: 15.0,
        fontFamily: 'Segoe UI',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        color: Color(0xbeffffff),
      );
}

abstract class HourlyChart extends _ChartWidget {
  const HourlyChart({
    Key? key,
    required this.weather,
    double? height,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Color? backgroundColor,
  }) : super(
          key: key,
          height: height,
          margin: margin,
          padding: padding,
          backgroundColor: backgroundColor,
        );

  final OneCallWeather weather;

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
    return super.build(context, ref);
  }

  @override
  Widget chart(BuildContext context) {
    final data = seriesData;
    final replacement = chartReplacement(context, data);
    return replacement ??
        SizedBox(
          height: height,
          child: SfCartesianChart(
            series: series(data),
            margin: padding,
            palette: palette,
            primaryXAxis: primaryXAxis(data),
            primaryYAxis: primaryYAxis(data),
            axes: axes,
            zoomPanBehavior: ZoomPanBehavior(
              enablePanning: true,
              zoomMode: ZoomMode.x,
            ),
          ),
        );
  }

  Widget? chartReplacement(BuildContext context, List<HourlyWeather> data) => null;

  List<ChartSeries> series(List<HourlyWeather> data);

  List<ChartAxis> get axes => [];

  ChartAxis? primaryYAxis(List<HourlyWeather> data) => NumericAxis(
        isVisible: primaryYAxisIsVisible,
        name: primaryYAxisName,
        anchorRangeToVisiblePoints: anchorRangeToVisiblePoints,
        rangePadding: primaryYAxisRangePadding,
        axisLabelFormatter: primaryYAxisLabelFormatter,
        minimum: primaryYAxisMinimum,
      );

  bool get anchorRangeToVisiblePoints => false;

  bool get primaryYAxisIsVisible => true;

  String? get primaryYAxisName => null;

  ChartRangePadding? get primaryYAxisRangePadding => null;

  ChartLabelFormatterCallback? get primaryYAxisLabelFormatter => null;

  double? get primaryYAxisMinimum => null;

  ChartAxis? primaryXAxis(List<HourlyWeather> data) => DateTimeAxis(
        interval: primaryXAxisInterval,
        desiredIntervals: 8,
        intervalType: DateTimeIntervalType.hours,
        plotBands: plotBands(data),
        multiLevelLabels: multiLevelLabels(data),
        multiLevelLabelStyle: multiLevelLabelStyle,
        autoScrollingMode: AutoScrollingMode.start,
        autoScrollingDelta: autoScrollingDelta,
      );

  double get primaryXAxisInterval => 3.0;

  int? get autoScrollingDelta => 24;

  MultiLevelLabelStyle get multiLevelLabelStyle =>
      const MultiLevelLabelStyle(borderType: MultiLevelBorderType.rectangle);

  List<PlotBand>? plotBands(List<HourlyWeather> data) {
    final bands = <PlotBand>[];
    if (data.isNotEmpty) {
      late DateTime end;
      var start = data.first.localDateTime;
      for (final hourly in data) {
        end = hourly.localDateTime;
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

  List<DateTimeMultiLevelLabel>? multiLevelLabels(List<HourlyWeather> data) {
    final dowFormat = DateFormat('EEEE');
    final labels = <DateTimeMultiLevelLabel>[];
    if (data.isNotEmpty) {
      late DateTime end;
      var start = data.first.localDateTime;
      var label = dowFormat.format(start);
      for (final hourly in data) {
        end = hourly.localDateTime;
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
    final currentHour = _truncatedToHour(DateTime.now().toUtc());
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
      if (data[i].localDateTime.hour % interval == 0) {
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
