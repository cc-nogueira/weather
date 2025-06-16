import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain_layer.dart';
import '../../../common/helper/hero_flight_shuttle_builder.dart';

class TimeHero extends ConsumerWidget {
  const TimeHero(this.weather, {super.key, this.color, this.fontSize});

  final Weather weather;
  final Color? color;
  final double? fontSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final style = textTheme.titleLarge!.copyWith(
      color: color ?? textTheme.headlineMedium!.color,
      fontSize: fontSize,
    );

    return _TimeHero(weather: weather, style: style);
  }
}

class _TimeHero extends ConsumerWidget {
  const _TimeHero({required this.weather, required this.style});

  final Weather weather;
  final TextStyle style;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = ref.watch(minuteMetronomeProvider).toUtc();
    final localTime = now.add(Duration(milliseconds: weather.geo.timeShiftMillis));
    final hr = localTime.hour.toString();
    final min = localTime.minute.toString().padLeft(2, '0');
    return Hero(
      tag: 'lat_${weather.geo.location.latitude}_long_${weather.geo.location.longitude}_time',
      flightShuttleBuilder: heroFittedBoxFlightShuttleBuilder,
      child: Text('$hr:$min', style: style),
    );
  }
}
