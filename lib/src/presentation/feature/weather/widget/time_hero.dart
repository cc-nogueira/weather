import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain_layer.dart';
import '../../../common/helper/hero_flight_shuttle_builder.dart';

class TimeHero extends ConsumerWidget {
  const TimeHero(this.city, {super.key, this.color, this.fontSize});

  final City city;
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

    return ref.watch(timeZoneProvider(city.location!)).when(
          loading: () => Text('--:--', style: style),
          error: (_, _) => Text('--:--', style: style),
          data: (data) => _TimeHero(city: city, timeZone: data, style: style),
        );
  }
}

class _TimeHero extends ConsumerWidget {
  const _TimeHero({required this.city, required this.timeZone, required this.style});

  final City city;
  final TimeZone timeZone;
  final TextStyle style;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = ref.watch(minuteMetronomeProvider).toUtc();
    final localTime = now.add(timeZone.currentUtcOffsetDuration);
    final hr = localTime.hour.toString();
    final min = localTime.minute.toString().padLeft(2, '0');
    return Hero(
      tag: '${city.id}_time',
      flightShuttleBuilder: heroFittedBoxFlightShuttleBuilder,
      child: Text('$hr:$min', style: style),
    );
  }
}
