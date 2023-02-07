import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../domain_layer.dart';
import '../../../../common/translation/noum_gender.dart';
import '../../../../l10n/translations.dart';
import '../../widget/wind_mixin.dart';
import 'scale_chart.dart';
import 'scale_intensity.dart';
import 'scale_widget.dart';

class WindScaleWidget extends ScaleWidget with WindMixin {
  const WindScaleWidget({super.key});

  @override
  NoumGender get intensityGender => NoumGender.masculine;

  @override
  String chartName(BuildContext context) => Translations.of(context)!.wind_chart_title;

  @override
  List<Color> colors() => windColors();

  @override
  Widget chart(BuildContext context) => WindScaleChart(intensityGender: intensityGender, chartName: chartName(context));
}

class WindScaleChart extends ConsumerWidget {
  const WindScaleChart({
    super.key,
    required this.intensityGender,
    required this.chartName,
    this.height,
  });

  final NoumGender intensityGender;
  final String chartName;
  final double? height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unit = ref.watch(windSpeedUnitProvider);
    return _WindScaleChart(
      unit: unit,
      intensityGender: intensityGender,
      chartName: chartName,
      height: height,
    );
  }
}

class _WindScaleChart extends IntensityScaleChart<Speed> with WindMixin {
  const _WindScaleChart({required super.unit, required super.intensityGender, required super.chartName, super.height});

  @override
  NoumGender get intensityGender => NoumGender.masculine;

  @override
  final intensityMap = const <ScaleIntensity, List<double>>{
    ScaleIntensity.light: [0.5, 1.0, 1.50, 2.0, 2.5, 2.99],
    ScaleIntensity.moderate: [3.5, 4.0, 4.5, 5.0, 5.5, 5.99],
    ScaleIntensity.strong: [6.66, 7.33, 8.0, 8.66, 9.33, 9.99],
    ScaleIntensity.storm: [10.83, 11.66, 12.5, 13.33, 14.16, 15.0]
  };

  @override
  List<ColumnSeries> series(List<double> data) => [
        ColumnSeries<double, int>(
            dataSource: data,
            xValueMapper: (data, idx) => idx,
            yValueMapper: (data, _) => _windInChartUnit(data),
            pointColorMapper: (data, _) => windColor(Wind(speed: data)),
            dataLabelMapper: (data, idx) =>
                data < 15 && idx % 6 == 5 ? '${_windInChartUnit(data).round()} ${unit.symbol}' : '',
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              labelAlignment: ChartDataLabelAlignment.auto,
              angle: 270,
              offset: Offset(0, 8),
            )),
      ];

  double _windInChartUnit(double value) => Speed.metersPerSecond(value).convertTo(unit).amount;

  @override
  ChartLabelFormatterCallback? get primaryYAxisLabelFormatter => (AxisLabelRenderDetails details) {
        late final double value;
        if (unit == Speed().meterPerSecond) {
          value = details.value.toDouble();
        } else {
          value = Quantity(amount: details.value.toDouble(), unit: unit).convertTo(Speed().meterPerSecond).amount;
        }
        return ChartAxisLabel(
          details.text,
          details.textStyle.copyWith(color: windColor(Wind(speed: value))),
        );
      };
}
