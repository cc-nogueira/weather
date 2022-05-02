import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widget/hero_flight_shuttle_builder.dart';

class WeatherTitleWidget extends ConsumerWidget {
  const WeatherTitleWidget({Key? key, required this.city, required this.style}) : super(key: key);

  final City city;
  final TextStyle style;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Hero(
        tag: '${city.id}_weatherTitle',
        flightShuttleBuilder: heroTextFlightShuttleBuilder,
        child: Text(city.name, style: style),
      );
}
