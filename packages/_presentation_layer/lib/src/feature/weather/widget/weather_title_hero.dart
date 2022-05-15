import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/helper/hero_flight_shuttle_builder.dart';

class WeatherTitleHero extends ConsumerWidget {
  const WeatherTitleHero({super.key, required this.city, required this.style});

  final City city;
  final TextStyle style;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Hero(
        tag: '${city.id}_weatherTitle',
        flightShuttleBuilder: heroTextFlightShuttleBuilder,
        child: FittedBox(
          alignment: Alignment.topLeft,
          child: Text(city.name, style: style),
        ),
      );
}
