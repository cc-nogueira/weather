import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../domain/entity/weather/city.dart';
import 'one_call_weather_refresh_mixin.dart';

class OneCallWeatherRefreshButton extends ConsumerWidget with OneCallWeatherRefreshMixin {
  const OneCallWeatherRefreshButton({super.key, required this.city});

  final City city;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messenger = ScaffoldMessenger.of(context);
    return Padding(
        padding: const EdgeInsets.only(right: 6.0),
        child: IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () => refresh(ref, messenger, city.location!),
        ));
  }
}
