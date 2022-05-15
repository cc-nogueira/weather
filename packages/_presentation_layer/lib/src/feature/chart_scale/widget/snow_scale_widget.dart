import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../weather/widget/snow_mixin.dart';
import 'scale_chart.dart';
import 'scale_widget.dart';

class SnowScaleWidget extends ScaleWidget with SnowMixin {
  const SnowScaleWidget({super.key});

  @override
  final chartName = 'Snow';

  @override
  List<Color> colors() => snowColors();

  @override
  Widget chart() => const SnowScaleChart();
}

class SnowScaleChart extends ConsumerWidget {
  const SnowScaleChart({Key? key, this.height}) : super(key: key);

  final double? height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unit = ref.watch(precipitationUnitProvider);
    return _SnowScaleChart(unit: unit, height: height);
  }
}

class _SnowScaleChart extends IntensityScaleChart<Speed> with SnowMixin {
  const _SnowScaleChart({required super.unit, super.height});

  @override
  final chartName = 'Snow';

  @override
  final intensityMap = const <String, List<double>>{
    'light': [0.17, 0.33, 0.5, 0.67, 0.83, 0.99],
    'moderate': [1.25, 1.5, 1.75, 2.0, 2.25, 2.49],
    'strong': [3.33, 4.17, 5.0, 5.83, 6.66, 7.49],
    'storm': [8.75, 10.0, 11.25, 12.5, 13.75, 15.0],
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
