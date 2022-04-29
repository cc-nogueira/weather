import 'dart:async';

import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'weather_tile.dart';

class WeatherList extends StatelessWidget {
  const WeatherList({Key? key, required this.read, required this.cities}) : super(key: key);

  final Reader read;
  final List<City> cities;

  @override
  Widget build(BuildContext context) {
    final tiles = <WeatherTile>[];
    for (var i = 0; i < cities.length; ++i) {
      tiles.add(
        WeatherTile(
          city: cities[i],
          onRemove: () => _removeCity(cities[i]),
        ),
      );
    }
    return _SortedWeatherList(tiles: tiles);
  }

  void _removeCity(City city) => read(citiesUsecaseProvider).remove(city.id);
}

class _SortedWeatherList extends ConsumerWidget {
  const _SortedWeatherList({Key? key, required this.tiles}) : super(key: key);

  final List<WeatherTile> tiles;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(weatherOrderProvider);
    if (order == WeatherOrder.byTemp) {
      for (final tile in tiles) {
        ref.watch<Celcius?>(tile.temperatureNotifierProvider);
      }
    }
    return _WeatherList(tiles: _sortTiles(ref.read, order));
  }

  List<WeatherTile> _sortTiles(Reader read, WeatherOrder order) {
    final list = tiles.toList();
    list.sort((a, b) {
      if (order == WeatherOrder.byName) {
        return a.city.alphabeticalOrderKey.compareTo(b.city.alphabeticalOrderKey);
      }
      if (order == WeatherOrder.byTemp) {
        final aTemp = read(a.temperatureNotifierProvider);
        final bTemp = read(b.temperatureNotifierProvider);
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
  const _WeatherList({Key? key, required this.tiles}) : super(key: key);

  final List<WeatherTile> tiles;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () => _refresh(ref),
      child: ListView(
        padding: const EdgeInsets.only(bottom: 48.0, top: 4.0),
        children: tiles,
      ),
    );
  }

  Future<void> _refresh(WidgetRef ref) {
    ref.invalidate(currentWeatherMetronomeProvider);
    return Future.value();
  }
}
