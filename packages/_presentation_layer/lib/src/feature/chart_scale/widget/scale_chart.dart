import 'package:flutter/material.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../common/translation/noum_gender.dart';
import '../../../l10n/translations.dart';
import '../../weather/one_call_weather/widget/chart_widget.dart';
import '../../weather/widget/color_range_mixin.dart';
import 'scale_intensity.dart';

abstract class ScaleChart<T extends PhysicalProperty<T>> extends ChartWidget with ColorRangeMixin {
  const ScaleChart({super.key, super.height, required this.unit, required this.chartName});

  final Unit<T> unit;
  final String chartName;

  @override
  Widget chart(BuildContext context) {
    final data = seriesData;
    return SizedBox(
      height: height,
      child: SfCartesianChart(
        series: series(data),
        margin: padding,
        primaryXAxis: primaryXAxis(context, data),
        primaryYAxis: primaryYAxis(context, data),
      ),
    );
  }

  @override
  Widget? chartTitle(BuildContext context) {
    return Row(
      children: [
        Text(Translations.of(context)!.scale_chart_title(chartName),
            style: titleStyle(context), textScaleFactor: 1.2),
        Text('(${unit.symbol})', style: titleUnitsStyle(context)),
      ],
    );
  }

  List<double> get seriesData;

  List<ChartSeries> series(List<double> data);

  ChartAxis? primaryXAxis(BuildContext context, List<double> data) => NumericAxis(
        majorTickLines: const MajorTickLines(size: 0),
        desiredIntervals: 4,
        axisLabelFormatter: (details) => ChartAxisLabel('', null),
        multiLevelLabels: multiLevelLabels(context, data),
        multiLevelLabelStyle: multiLevelLabelStyle,
      );

  List<NumericMultiLevelLabel>? multiLevelLabels(BuildContext context, List<double> data) => null;

  MultiLevelLabelStyle? get multiLevelLabelStyle => null;

  ChartAxis? primaryYAxis(BuildContext context, List<double> data) => NumericAxis(
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
  const IntensityScaleChart(
      {super.key,
      super.height,
      required this.intensityGender,
      required super.unit,
      required super.chartName});

  Map<ScaleIntensity, List<double>> get intensityMap;

  final NoumGender intensityGender;

  @override
  List<double> get seriesData => [
        ...intensityMap[ScaleIntensity.light]!,
        ...intensityMap[ScaleIntensity.moderate]!,
        ...intensityMap[ScaleIntensity.strong]!,
        ...intensityMap[ScaleIntensity.storm]!,
      ];

  @override
  List<NumericMultiLevelLabel>? multiLevelLabels(BuildContext context, List<double> data) {
    final translations = Translations.of(context)!;
    final labels = <NumericMultiLevelLabel>[];
    var start = -0.5;
    for (final intensity in intensityMap.entries) {
      final end = start + intensity.value.length;
      final label = intensity.key.translation(translations, intensityGender);
      labels.add(NumericMultiLevelLabel(start: start, end: end, text: label));
      start = end;
    }
    return labels;
  }

  @override
  MultiLevelLabelStyle? get multiLevelLabelStyle =>
      const MultiLevelLabelStyle(borderType: MultiLevelBorderType.rectangle);
}
