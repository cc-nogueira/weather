import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../weather/widget/wind_mixin.dart';
import 'scale_chart.dart';
import 'scale_widget.dart';

class WindScaleWidget extends ScaleWidget with WindMixin {
  const WindScaleWidget({Key? key}) : super(key: key);

  @override
  final chartName = 'Wind';

  @override
  List<Color> colors() => windColors();

  @override
  Widget chart() => const WindScaleChart();
}

class WindScaleChart extends ConsumerWidget {
  const WindScaleChart({Key? key, this.height}) : super(key: key);

  final double? height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unit = ref.watch(windSpeedUnitProvider);
    return _WindScaleChart(unit: unit, height: height);
  }
}

class _WindScaleChart extends ScaleChart<Speed> with WindMixin {
  const _WindScaleChart({Key? key, required Unit<Speed> unit, double? height})
      : super(key: key, height: height, unit: unit);

  @override
  final chartName = 'Wind';

  @override
  final intensityMap = const <String, List<double>>{
    'light': [0.5, 1.0, 1.50, 2.0, 2.5, 2.99],
    'moderate': [3.5, 4.0, 4.5, 5.0, 5.5, 5.99],
    'strong': [6.66, 7.33, 8.0, 8.66, 9.33, 9.99],
    'storm': [10.83, 11.66, 12.5, 13.33, 14.16, 15.0]
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
          value = Quantity(amount: details.value.toDouble(), unit: unit)
              .convertTo(Speed().meterPerSecond)
              .amount;
        }
        return ChartAxisLabel(
          details.text,
          details.textStyle.copyWith(color: windColor(Wind(speed: value))),
        );
      };
}
