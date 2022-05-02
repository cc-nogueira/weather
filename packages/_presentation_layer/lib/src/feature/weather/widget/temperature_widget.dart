import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TemperatureWidget extends ConsumerWidget {
  const TemperatureWidget({Key? key, required this.city, required this.weather}) : super(key: key);

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
            style: Theme.of(context).textTheme.headline4,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              unit.symbol,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
    );
  }
}
