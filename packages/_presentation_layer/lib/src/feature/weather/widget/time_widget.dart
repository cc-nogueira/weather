import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widget/hero_flight_shuttle_builder.dart';

class TimeWidget extends ConsumerWidget {
  const TimeWidget(this.city, {Key? key, this.color, this.fontSize}) : super(key: key);

  final City city;
  final Color? color;
  final double? fontSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final style = textTheme.headline6!.copyWith(
      color: color ?? textTheme.headline4!.color,
      fontSize: fontSize,
    );

    return ref.watch(timeZoneProvider(city.location!)).when(
          loading: () => Text('--:--', style: style),
          error: (_, __) => Text('--:--', style: style),
          data: (data) => _TimeWidget(city: city, timeZone: data, style: style),
        );
  }
}

class _TimeWidget extends ConsumerWidget {
  const _TimeWidget({
    Key? key,
    required this.city,
    required this.timeZone,
    required this.style,
  }) : super(key: key);

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
      flightShuttleBuilder: heroTextFlightShuttleBuilder,
      child: Text('$hr:$min', style: style),
    );
  }
}
