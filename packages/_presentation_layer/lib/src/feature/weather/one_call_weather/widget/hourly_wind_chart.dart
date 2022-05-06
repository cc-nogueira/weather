import 'dart:math';

import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tuple/tuple.dart';

import '../../widget/weather_widget_mixin.dart';
import '../../widget/wind_mixin.dart';
import 'hourly_chart.dart';

class HourlyWindChart extends ConsumerWidget {
  const HourlyWindChart({
    Key? key,
    required this.weather,
    this.height,
    this.margin,
    this.padding,
    this.backgroundColor,
  }) : super(key: key);

  final OneCallWeather weather;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _HourlyWindChart(
      weather: weather,
      unit: ref.watch(windSpeedUnitProvider),
      height: height,
      margin: margin,
      padding: padding,
      backgroundColor: backgroundColor,
    );
  }
}

class _HourlyWindChart extends HourlyChart with WindMixin, WeatherWidgetMixin {
  const _HourlyWindChart({
    Key? key,
    required OneCallWeather weather,
    required this.unit,
    double? height,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Color? backgroundColor,
  }) : super(
            key: key,
            weather: weather,
            height: height,
            margin: margin,
            padding: padding,
            backgroundColor: backgroundColor);

  final Unit<Speed> unit;

  @override
  Widget? chartTitle(BuildContext context) {
    return Row(
      children: [
        Text('Wind ', style: titleStyle(context), textScaleFactor: 1.2),
        Text('(${unit.symbol})', style: titleUnitsStyle(context)),
      ],
    );
  }

  @override
  List<XyDataSeries> series(List<HourlyWeather> data) {
    const windValue = 2.0;
    final colorGrad = _windColorGradient(data);

    return [
      SplineAreaSeries<HourlyWeather, DateTime>(
        name: 'WindArea',
        dataSource: data,
        color: palette[0].withOpacity(0.6),
        gradient: colorGrad,
        dataLabelSettings: const DataLabelSettings(labelAlignment: ChartDataLabelAlignment.middle),
        xValueMapper: (item, idx) => item.localDateTime,
        yValueMapper: (item, _) => _wind(item).amount,
      ),
      SplineSeries<HourlyWeather, DateTime>(
        name: 'Wind',
        dataSource: data,
        pointColorMapper: _windColor,
        width: 3.0,
        dataLabelSettings: const DataLabelSettings(labelAlignment: ChartDataLabelAlignment.middle),
        xValueMapper: (item, idx) => item.localDateTime,
        yValueMapper: (item, _) => _wind(item).amount,
      ),
      // ColumnSeries<HourlyWeather, DateTime>(
      //   name: 'WindColumns',
      //   dataSource: data,
      //   pointColorMapper: _windColor,
      //   dataLabelSettings: const DataLabelSettings(labelAlignment: ChartDataLabelAlignment.middle),
      //   xValueMapper: (item, idx) => item.localDateTime,
      //   yValueMapper: (item, _) => 0,
      // ),
      ScatterSeries<HourlyWeather, DateTime>(
        dataSource: seriesDataForAxisIntervals(data),
        xValueMapper: (item, idx) => item.localDateTime,
        yValueMapper: (item, idx) => windValue,
        color: Colors.transparent,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          builder: (dynamic item, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
            final hourly = item as HourlyWeather;
            return SizedBox(
              height: 29,
              child: windIcon(hourly.conditions.wind, size: 26, color: Colors.amber[400]),
              // size: 26, color: windColor(hourly.conditions.wind)),
            );
          },
          alignment: ChartAlignment.center,
          labelAlignment: ChartDataLabelAlignment.middle,
        ),
      ),
    ];
  }

  //@override
  //double? get primaryYAxisMinimum => 0.0;

  @override
  ChartLabelFormatterCallback? get primaryYAxisLabelFormatter => (AxisLabelRenderDetails details) {
        late final double speed;
        if (unit == Speed().meterPerSecond) {
          speed = details.value.toDouble();
        } else {
          speed = Quantity(amount: details.value.toDouble(), unit: unit)
              .convertTo(Speed().meterPerSecond)
              .amount;
        }
        return ChartAxisLabel(
          details.text,
          details.textStyle.copyWith(color: windColor(Wind(speed: speed))),
        );
      };

  Color _windColor(HourlyWeather hourly, int index) => windColor(hourly.conditions.wind);

  Quantity<Speed> _wind(HourlyWeather hourly) {
    final wind = hourly.conditions.wind;
    return wind.speedQuantity.convertTo(unit);
  }

  LinearGradient _windColorGradient(List<HourlyWeather> data) {
    final windRange = _windRange(data);
    final topWind = min(
      15.0,
      Quantity(amount: windRange.item2, unit: unit).convertTo(Speed().meterPerSecond).amount,
    );
    final colors = [windColor(const Wind(speed: 0.0))];
    final steps = [0.0];
    if (topWind > 2.5) {
      colors.add(windColor(const Wind(speed: 2.5)));
      steps.add(2.5);
      if (topWind > 6.0) {
        colors.add(windColor(const Wind(speed: 6.0)));
        steps.add(6.0);
        if (topWind > 10.0) {
          colors.add(windColor(const Wind(speed: 10.0)));
          steps.add(10.0);
        }
      }
    }
    colors.add(windColor(Wind(speed: topWind)));
    steps.add(topWind);

    final stops = steps.map((e) => e / topWind).toList();
    return LinearGradient(
        colors: colors, begin: Alignment.bottomCenter, end: Alignment.topCenter, stops: stops);
  }

  Tuple2<double, double> _windRange(List<HourlyWeather> data) {
    if (data.isEmpty) return const Tuple2(0.0, 0.0);
    var minT = _wind(data[0]).amount;
    var maxT = minT;
    for (var i = 1; i < data.length; ++i) {
      final value = _wind(data[i]).amount;
      minT = min(minT, value);
      maxT = max(maxT, value);
    }
    return Tuple2(minT, maxT);
  }
}