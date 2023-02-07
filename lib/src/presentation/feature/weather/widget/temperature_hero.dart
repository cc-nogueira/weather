import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entity/weather/city.dart';
import '../../../../domain/entity/weather/weather.dart';
import '../../../../domain/usecase/preferences_usecase.dart';

class TemperatureHero extends ConsumerWidget {
  const TemperatureHero({super.key, required this.city, required this.weather});

  final City city;
  final Weather weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unit = ref.watch(temperatureUnitProvider);
    return Hero(
      tag: '${city.id}_temperature',
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${weather.conditions.temperatures.temperature.quantity.convertTo(unit).amount.round()}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              unit.symbol,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          )
        ],
      ),
    );
  }
}
