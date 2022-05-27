import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../common/helper/theme_builder.dart';
import '../../../../l10n/translations.dart';
import '../../widget/temperature_mixin.dart';
import 'scale_chart.dart';

class TemperatureScaleWidget extends StatelessWidget {
  const TemperatureScaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    final theme = const ThemeBuilder().darkTheme;
    const txtSt = TextStyle(fontSize: 16);
    return Material(
      type: MaterialType.transparency,
      child: Theme(
        data: theme,
        child: DefaultTextStyle(
          style: TextStyle(color: theme.colorScheme.onSurface),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  border: Border.all(color: theme.colorScheme.onSurface)),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    child: Text(Translations.of(context)!.scale_chart_header_sample_message,
                        style: txtSt),
                  ),
                  const TemperatureScaleChart(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TemperatureScaleChart extends ConsumerWidget {
  const TemperatureScaleChart({super.key, this.height});

  final double? height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unit = ref.watch(temperatureUnitProvider);
    final chartName = Translations.of(context)!.temp_chart_title;
    return _TemperatureScaleChart(unit: unit, chartName: chartName, height: height);
  }
}

class _TemperatureScaleChart extends ScaleChart<Temperature> with TemperatureMixin {
  const _TemperatureScaleChart({required super.unit, required super.chartName, super.height});

  @override
  List<double> get seriesData => [
        ...[-20.0, -17.5, -15.0, -12.5, -10.0, -7.5],
        ...[-5.0, -2.5, 0.0, 2.5, 5.0, 7.5],
        ...[10.0, 12.5, 15.0, 17.5, 20.0, 22.5],
        ...[25.0, 27.5, 30.0, 32.5, 35.0, 37.5],
        40,
      ];

  @override
  List<ColumnSeries> series(List<double> data) => [
        ColumnSeries<double, int>(
          dataSource: data,
          xValueMapper: (data, idx) => idx,
          yValueMapper: (data, _) => _temperatureInChartUnit(data),
          pointColorMapper: (data, _) => temperatureColor(Celcius(data)),
        ),
      ];

  double _temperatureInChartUnit(double value) =>
      Temperature.degreesCelcius(value).convertTo(unit).amount;

  @override
  ChartLabelFormatterCallback? get primaryYAxisLabelFormatter => (AxisLabelRenderDetails details) {
        final celciusUnit = Temperature().celcius;
        late final double amountInCelcius;
        if (unit == celciusUnit) {
          amountInCelcius = details.value.toDouble();
        } else {
          amountInCelcius =
              Quantity(amount: details.value.toDouble(), unit: unit).convertTo(celciusUnit).amount;
        }
        return ChartAxisLabel(
          details.text,
          details.textStyle.copyWith(color: temperatureColor(Celcius(amountInCelcius))),
        );
      };
}
