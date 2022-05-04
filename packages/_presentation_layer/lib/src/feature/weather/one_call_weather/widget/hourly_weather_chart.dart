import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

abstract class _ChartWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final title = chartTitle(context);
    return DecoratedBox(
      decoration: BoxDecoration(color: backgroundColor),
      child: Padding(
        padding: margin,
        child: Column(
          children: [
            if (title != null)
              Padding(
                padding: EdgeInsets.only(left: padding.left, right: padding.right),
                child: title,
              ),
            SizedBox(
              height: height,
              child: chart(context),
            ),
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

abstract class HourlyWeatherChart extends _ChartWidget {
  const HourlyWeatherChart({
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
  Widget chart(BuildContext context) {
    final data = seriesData;
    return SfCartesianChart(
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
    );
  }

  List<ChartSeries> series(List<HourlyWeather> data);

  List<ChartAxis> get axes => [];

  ChartAxis? primaryYAxis(List<HourlyWeather> data) => NumericAxis(
        name: primaryYAxisName,
        anchorRangeToVisiblePoints: anchorRangeToVisiblePoints,
        rangePadding: primaryYAxisRangePadding,
        axisLabelFormatter: primaryYAxisLabelFormatter,
      );

  bool get anchorRangeToVisiblePoints => false;

  String? get primaryYAxisName => null;

  ChartRangePadding? get primaryYAxisRangePadding => null;

  ChartLabelFormatterCallback? get primaryYAxisLabelFormatter => null;

  ChartAxis? primaryXAxis(List<HourlyWeather> data) => DateTimeAxis(
        interval: 3,
        desiredIntervals: 8,
        intervalType: DateTimeIntervalType.hours,
        plotBands: plotBands(data),
        multiLevelLabels: multiLevelLabels(data),
        multiLevelLabelStyle: multiLevelLabelStyle,
        autoScrollingMode: AutoScrollingMode.start,
        autoScrollingDelta: 24,
      );

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
      color: Colors.lightGreen[800]!,
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

  DateTime _truncatedToHour(DateTime dt) => DateTime(dt.year, dt.month, dt.day, dt.hour);
}
