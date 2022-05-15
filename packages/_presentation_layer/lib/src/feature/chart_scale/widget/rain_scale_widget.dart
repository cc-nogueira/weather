import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../weather/widget/rain_mixin.dart';
import 'scale_chart.dart';
import 'scale_widget.dart';

class RainScaleWidget extends ScaleWidget with RainMixin {
  const RainScaleWidget({super.key});

  @override
  final chartName = 'Rain';

  @override
  List<Color> colors() => rainColors();

  @override
  Widget chart() => const RainScaleChart();
}

class RainScaleChart extends ConsumerWidget {
  const RainScaleChart({super.key, this.height});

  final double? height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unit = ref.watch(precipitationUnitProvider);
    return _RainScaleChart(unit: unit, height: height);
  }
}

class _RainScaleChart extends IntensityScaleChart<Speed> with RainMixin {
  const _RainScaleChart({required super.unit, super.height});

  @override
  final chartName = 'Rain';

  @override
  final intensityMap = const <String, List<double>>{
    'light': [0.41, 0.83, 1.25, 1.66, 2.08, 2.49],
    'moderate': [3.33, 4.17, 5.0, 5.83, 6.67, 7.49],
    'strong': [11.25, 15.0, 18.75, 22.5, 26.25, 29.99],
    'storm': [33.33, 36.67, 40, 43.33, 46.67, 50.0]
  };

  @override
  List<ColumnSeries> series(List<double> data) => [
        ColumnSeries<double, int>(
            dataSource: data,
            xValueMapper: (data, idx) => idx,
            yValueMapper: (data, _) => _rainInChartUnit(data),
            pointColorMapper: (data, _) => rainColor(data),
            dataLabelMapper: (data, idx) => data < 30 && idx % 6 == 5
                ? '${_rainInChartUnit(data).toStringAsFixed(1)} ${unit.symbol}'
                : '',
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              labelAlignment: ChartDataLabelAlignment.auto,
              angle: 270,
              offset: Offset(0, 12),
            )),
      ];

  double _rainInChartUnit(double value) => Speed.millimetersPerHour(value).convertTo(unit).amount;

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
          details.textStyle.copyWith(color: rainColor(value)),
        );
      };
}
