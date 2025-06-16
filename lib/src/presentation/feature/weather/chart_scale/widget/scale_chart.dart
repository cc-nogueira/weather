import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../common/translation/noum_gender.dart';
import '../../../../l10n/translations.dart';
import '../../one_call_weather/widget/chart_widget.dart';
import '../../widget/color_range_mixin.dart';
import 'scale_intensity.dart';

abstract class ScaleChart<T extends PhysicalProperty<T>> extends ChartWidget with ColorRangeMixin {
  const ScaleChart({super.key, super.height, required this.unit, required this.chartName});

  final Unit<T> unit;
  final String chartName;

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
                padding: EdgeInsets.only(left: padding.left, right: padding.right, top: padding.top),
                child: title,
              ),
            chart(context),
          ],
        ),
      ),
    );
  }

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

  Widget? chartTitle(BuildContext context) {
    return Row(
      children: [
        Text(
          Translations.of(context)!.scale_chart_title(chartName),
          style: titleStyle(context),
          textScaler: TextScaler.linear(1.2),
        ),
        Text('(${unit.symbol})', style: titleUnitsStyle(context)),
      ],
    );
  }

  List<double> get seriesData;

  List<CartesianSeries> series(List<double> data);

  ChartAxis primaryXAxis(BuildContext context, List<double> data) => NumericAxis(
    majorTickLines: const MajorTickLines(size: 0),
    desiredIntervals: 4,
    axisLabelFormatter: (details) => ChartAxisLabel('', null),
    multiLevelLabels: multiLevelLabels(context, data),
    multiLevelLabelStyle: multiLevelLabelStyle,
  );

  List<NumericMultiLevelLabel>? multiLevelLabels(BuildContext context, List<double> data) => null;

  MultiLevelLabelStyle get multiLevelLabelStyle => const MultiLevelLabelStyle();

  ChartAxis primaryYAxis(BuildContext context, List<double> data) => NumericAxis(
    isVisible: true,
    anchorRangeToVisiblePoints: false,
    rangePadding: ChartRangePadding.none,
    axisLabelFormatter: primaryYAxisLabelFormatter,
    minimum: primaryYAxisMinimum,
    maximum: primaryYAxisMaximum,
  );

  ChartLabelFormatterCallback? get primaryYAxisLabelFormatter => null;
  double? get primaryYAxisMinimum => null;
  double? get primaryYAxisMaximum => null;
}

abstract class IntensityScaleChart<T extends PhysicalProperty<T>> extends ScaleChart<T> {
  const IntensityScaleChart({
    super.key,
    super.height,
    required this.intensityGender,
    required super.unit,
    required super.chartName,
  });

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
  MultiLevelLabelStyle get multiLevelLabelStyle =>
      const MultiLevelLabelStyle(borderType: MultiLevelBorderType.rectangle);
}
