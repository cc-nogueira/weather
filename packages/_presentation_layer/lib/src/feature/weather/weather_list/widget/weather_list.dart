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
    final cache = read(weatherCacheProvider);
    list.sort((a, b) {
      if (order == WeatherOrder.byName) {
        return a.city.alphabeticalOrderKey.compareTo(b.city.alphabeticalOrderKey);
      }
      if (order == WeatherOrder.byTemp) {
        final aTemp = cache[a.city.location!]?.weather.conditions.temperatures;
        final bTemp = cache[b.city.location!]?.weather.conditions.temperatures;
        if (aTemp == null && bTemp == null) {
          return a.city.alphabeticalOrderKey.compareTo(b.city.alphabeticalOrderKey);
        }
        if (aTemp == null) return 1;
        if (bTemp == null) return -1;
        return bTemp.temperature.value.compareTo(aTemp.temperature.value);
      }
      return a.city.order.compareTo(b.city.order);
    });
    return list;
  }
}

class _WeatherList extends ConsumerWidget {
  _WeatherList({Key? key, required this.tiles}) : super(key: key);

  final List<WeatherTile> tiles;
  final _timerController = StateController<Timer>(Timer(Duration.zero, () {}));
  final _refreshInterval = const Duration(minutes: 60);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!_timerController.state.isActive) {
      _setPeriodicRefresh(ref);
    }
    return RefreshIndicator(
      onRefresh: () => _refresh(ref),
      child: ListView(
        padding: const EdgeInsets.only(bottom: 48.0, top: 4.0),
        children: tiles,
      ),
    );
  }

  Future<void> _refresh(WidgetRef ref) {
    _timerController.state.cancel();
    for (var each in tiles) {
      each.refresh(ref);
    }
    _setPeriodicRefresh(ref);
    return Future.value();
  }

  void _setPeriodicRefresh(WidgetRef ref) =>
      _timerController.state = Timer(_refreshInterval, () => _refresh(ref));
}
