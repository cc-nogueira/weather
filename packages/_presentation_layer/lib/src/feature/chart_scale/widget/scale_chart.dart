import 'package:flutter/material.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../weather/one_call_weather/widget/chart_widget.dart';
import '../../weather/widget/color_range_mixin.dart';

abstract class ScaleChart<T extends PhysicalProperty<T>> extends ChartWidget with ColorRangeMixin {
  const ScaleChart({super.key, super.height, required this.unit});

  final Unit<T> unit;

  @override
  Widget chart(BuildContext context) {
    final data = seriesData;
    return SizedBox(
      height: height,
      child: SfCartesianChart(
        series: series(data),
        margin: padding,
        primaryXAxis: primaryXAxis(data),
        primaryYAxis: primaryYAxis(data),
      ),
    );
  }

  String get chartName;

  @override
  Widget? chartTitle(BuildContext context) {
    return Row(
      children: [
        Text('$chartName scale ', style: titleStyle(context), textScaleFactor: 1.2),
        Text('(${unit.symbol})', style: titleUnitsStyle(context)),
      ],
    );
  }

  List<double> get seriesData;

  List<ChartSeries> series(List<double> data);

  ChartAxis? primaryXAxis(List<double> data) => NumericAxis(
        majorTickLines: const MajorTickLines(size: 0),
        desiredIntervals: 4,
        axisLabelFormatter: (details) => ChartAxisLabel('', null),
        multiLevelLabels: multiLevelLabels(data),
        multiLevelLabelStyle: multiLevelLabelStyle,
      );

  List<NumericMultiLevelLabel>? multiLevelLabels(List<double> data) => null;

  MultiLevelLabelStyle? get multiLevelLabelStyle => null;

  ChartAxis? primaryYAxis(List<double> data) => NumericAxis(
        isVisible: true,
        anchorRangeToVisiblePoints: false,
        rangePadding: null,
        axisLabelFormatter: primaryYAxisLabelFormatter,
        minimum: primaryYAxisMinimum,
        maximum: primaryYAxisMaximum,
      );

  ChartLabelFormatterCallback? get primaryYAxisLabelFormatter => null;
  double? get primaryYAxisMinimum => null;
  double? get primaryYAxisMaximum => null;
}

abstract class IntensityScaleChart<T extends PhysicalProperty<T>> extends ScaleChart<T> {
  const IntensityScaleChart({super.key, super.height, required super.unit});

  Map<String, List<double>> get intensityMap;

  @override
  List<double> get seriesData => [
        ...intensityMap['light']!,
        ...intensityMap['moderate']!,
        ...intensityMap['strong']!,
        ...intensityMap['storm']!,
      ];

  @override
  List<NumericMultiLevelLabel>? multiLevelLabels(List<double> data) {
    final labels = <NumericMultiLevelLabel>[];
    var start = -0.5;
    for (final intensity in intensityMap.entries) {
      final end = start + intensity.value.length;
      labels.add(NumericMultiLevelLabel(start: start, end: end, text: intensity.key));
      start = end;
    }
    return labels;
  }

  @override
  MultiLevelLabelStyle? get multiLevelLabelStyle =>
      const MultiLevelLabelStyle(borderType: MultiLevelBorderType.rectangle);
}
