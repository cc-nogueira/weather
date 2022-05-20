import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../common/translation/noum_gender.dart';
import '../../../l10n/translations.dart';
import '../../weather/widget/snow_mixin.dart';
import 'scale_chart.dart';
import 'scale_intensity.dart';
import 'scale_widget.dart';

class SnowScaleWidget extends ScaleWidget with SnowMixin {
  const SnowScaleWidget({super.key});

  @override
  NoumGender get intensityGender => NoumGender.feminine;

  @override
  String chartName(BuildContext context) => Translations.of(context)!.snow_chart_title;

  @override
  List<Color> colors() => snowColors();

  @override
  Widget chart(BuildContext context) => SnowScaleChart(
        intensityGender: intensityGender,
        chartName: chartName(context),
      );
}

class SnowScaleChart extends ConsumerWidget {
  const SnowScaleChart(
      {super.key, required this.intensityGender, required this.chartName, this.height});

  final NoumGender intensityGender;
  final String chartName;
  final double? height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unit = ref.watch(precipitationUnitProvider);
    return _SnowScaleChart(
      unit: unit,
      intensityGender: intensityGender,
      chartName: chartName,
      height: height,
    );
  }
}

class _SnowScaleChart extends IntensityScaleChart<Speed> with SnowMixin {
  const _SnowScaleChart(
      {required super.unit,
      required super.intensityGender,
      required super.chartName,
      super.height});

  @override
  NoumGender get intensityGender => NoumGender.feminine;

  @override
  final intensityMap = const <ScaleIntensity, List<double>>{
    ScaleIntensity.light: [0.17, 0.33, 0.5, 0.67, 0.83, 0.99],
    ScaleIntensity.moderate: [1.25, 1.5, 1.75, 2.0, 2.25, 2.49],
    ScaleIntensity.strong: [3.33, 4.17, 5.0, 5.83, 6.66, 7.49],
    ScaleIntensity.storm: [8.75, 10.0, 11.25, 12.5, 13.75, 15.0],
  };

  @override
  List<ColumnSeries> series(List<double> data) => [
        ColumnSeries<double, int>(
            dataSource: data,
            xValueMapper: (data, idx) => idx,
            yValueMapper: (data, _) => _snowInChartUnit(data),
            pointColorMapper: (data, _) => snowColor(data),
            dataLabelMapper: (data, idx) => data < 15 && idx % 6 == 5 ? _formattedLabel(data) : '',
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              labelAlignment: ChartDataLabelAlignment.auto,
              angle: 270,
              offset: Offset(0, 15),
            )),
      ];

  String _formattedLabel(double data) {
    final value = _snowInChartUnit(data);
    final precision = unit == Speed().millimeterPerHour ? 1 : (value > 0.2 ? 1 : 2);
    return '${value.toStringAsFixed(precision)} ${unit.symbol}';
  }

  double _snowInChartUnit(double value) => Speed.millimetersPerHour(value).convertTo(unit).amount;

  @override
  ChartLabelFormatterCallback? get primaryYAxisLabelFormatter => (AxisLabelRenderDetails details) {
        late final double value;
        if (unit == Speed().millimeterPerHour) {
          value = details.value.toDouble();
        } else {
          value = Quantity(amount: details.value.toDouble(), unit: unit)
              .convertTo(Speed().millimeterPerHour)
              .amount;
        }
        return ChartAxisLabel(
          details.text,
          details.textStyle.copyWith(color: snowColor(value)),
        );
      };
}
