import 'package:flutter/material.dart';

import '../../../../core/utils/string_utils.dart';
import '../../../../domain_layer.dart';
import '../../../common/helper/hero_flight_shuttle_builder.dart';

class WeatherConditionsHero extends StatelessWidget {
  const WeatherConditionsHero({super.key, required this.city, required this.weather});

  final City city;
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.normal);
    return Hero(
        tag: '${city.id}_weatherConditions',
        flightShuttleBuilder: heroFittedBoxFlightShuttleBuilder,
        child: Text(weather.conditions.description.capitalized, style: style));
  }
}
