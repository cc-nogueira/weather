import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../domain_layer.dart';
import '../../../../l10n/translations.dart';
import 'weather_tile.dart';

class WeatherList extends ConsumerWidget {
  const WeatherList({super.key, required this.ref, required this.cities});

  final WidgetRef ref;
  final List<City> cities;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isByCountry = ref.watch(weatherOrderProvider.select((value) => value == WeatherOrder.byCountry));

    final translations = Translations.of(context)!;
    final tiles = <WeatherTile>[];
    for (var i = 0; i < cities.length; ++i) {
      tiles.add(
        WeatherTile(
          translations: translations,
          city: cities[i],
          showCountry: isByCountry,
          onRemove: () => _removeCity(cities[i]),
        ),
      );
    }
    return _SortedWeatherList(tiles: tiles);
  }

  void _removeCity(City city) => ref.read(citiesUsecaseProvider).remove(city.id);
}

class _SortedWeatherList extends ConsumerWidget {
  const _SortedWeatherList({required this.tiles});

  final List<WeatherTile> tiles;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(weatherOrderProvider);
    if (order == WeatherOrder.byTemp) {
      for (final tile in tiles) {
        ref.watch<Celcius?>(tile.temperatureNotifierProvider);
      }
    }
    return _WeatherList(tiles: _sortTiles(ref, order));
  }

  List<WeatherTile> _sortTiles(WidgetRef ref, WeatherOrder order) {
    final list = tiles.toList();
    list.sort((a, b) {
      if (order == WeatherOrder.byCountry) {
        return a.city.alphabeticalOrderByCountryKey.compareTo(b.city.alphabeticalOrderByCountryKey);
      }
      if (order == WeatherOrder.byName) {
        return a.city.alphabeticalOrderKey.compareTo(b.city.alphabeticalOrderKey);
      }
      if (order == WeatherOrder.byTemp) {
        final aTemp = ref.read(a.temperatureNotifierProvider);
        final bTemp = ref.read(b.temperatureNotifierProvider);
        if (aTemp == null && bTemp == null) {
          return a.city.alphabeticalOrderKey.compareTo(b.city.alphabeticalOrderKey);
        }
        if (aTemp == null) return 1;
        if (bTemp == null) return -1;
        return bTemp.value.compareTo(aTemp.value);
      }
      return a.city.order.compareTo(b.city.order);
    });
    return list;
  }
}

class _WeatherList extends ConsumerWidget {
  const _WeatherList({required this.tiles});

  final List<WeatherTile> tiles;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () => _refresh(context, ref),
      child: ListView(
        padding: const EdgeInsets.only(bottom: 48.0, top: 4.0),
        children: tiles,
      ),
    );
  }

  Future<void> _refresh(BuildContext context, WidgetRef ref) async {
    const minRefreshInterval = WeatherUsecase.currentWeatherMinRefreshInterval;
    final lastRefresh = ref.read(currentWeatherMetronomeProvider);
    if (DateTime.now().difference(lastRefresh) < minRefreshInterval) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Weather already refreshed in the last ${minRefreshInterval.inMinutes} minutes')));
      return;
    }

    ref.invalidate(currentWeatherMetronomeProvider);
  }
}
