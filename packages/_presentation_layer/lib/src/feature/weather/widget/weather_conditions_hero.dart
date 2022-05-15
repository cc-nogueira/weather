import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';

import '../../../common/helper/hero_flight_shuttle_builder.dart';

class WeatherConditionsHero extends StatelessWidget {
  const WeatherConditionsHero({super.key, required this.city, required this.weather});

  final City city;
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyText2;
    return Hero(
        tag: '${city.id}_weatherConditions',
        flightShuttleBuilder: heroTextFlightShuttleBuilder,
        child: Text(
          '${weather.conditions.title} (${weather.conditions.description})',
          style: style,
        ));
  }
}
