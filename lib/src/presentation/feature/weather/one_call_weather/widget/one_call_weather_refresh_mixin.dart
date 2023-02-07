import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../domain/entity/common/location.dart';
import '../../../../../domain/provider/providers.dart';
import '../../../../../domain/usecase/weather_usecase.dart';

mixin OneCallWeatherRefreshMixin {
  Future<void> refresh(WidgetRef ref, ScaffoldMessengerState messenger, Location location) async {
    const minRefreshInterval = WeatherUsecase.oneCallWeatherMinRefreshInterval;
    final tuple = await ref.read(oneCallWeatherTupleByLocationProvider(location).future);
    if (DateTime.now().difference(tuple.item2) < minRefreshInterval) {
      messenger.showSnackBar(
          SnackBar(content: Text('Weather already refreshed in the last ${minRefreshInterval.inMinutes} minutes')));
      return;
    }

    ref.invalidate(oneCallWeatherTupleByLocationProvider(location));
    ref.invalidate(oneCallWeatherByLocationAutoEvictProvider(location));
  }
}
