import 'dart:async';

import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'weather_tile.dart';

class WeatherList extends StatelessWidget {
  WeatherList({Key? key, required this.read, required this.cities}) : super(key: key);

  final Reader read;
  final List<City> cities;
  late final _loadedStatus = List.generate(cities.length, (_) => false);

  @override
  Widget build(BuildContext context) {
    final tiles = <WeatherTile>[];
    for (var i = 0; i < cities.length; ++i) {
      tiles.add(
        WeatherTile(
          city: cities[i],
          onLoaded: () => _loadedStatus[i] = true,
          onRemove: () => _removeCity(cities[i]),
        ),
      );
    }
    return _WeatherList(tiles: tiles, loadedStatus: _loadedStatus);
  }

  void _removeCity(City city) => read(citiesUsecaseProvider).remove(city.id);
}

class _LoadingSortWeatherList extends ConsumerWidget {
  _LoadingSortWeatherList({
    Key? key,
    required this.tiles,
    required this.loadedStatus,
  }) : super(key: key);

  final List<WeatherTile> tiles;
  final List<bool> loadedStatus;
  late final _loadedProvider = StateProvider((_) => _isFullyLoaded);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(weatherOrderProvider);
    if (order == WeatherOrder.byTemp) {
      if (!_isFullyLoaded) {
        ref.watch(_loadedProvider);
        _scheduleRebuild(ref.read);
      }
    }
    return _WeatherList(tiles: tiles, loadedStatus: loadedStatus);
  }

  bool get _isFullyLoaded => loadedStatus.every((value) => value);

  void _scheduleRebuild(Reader read) {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_isFullyLoaded) {
        read(_loadedProvider.notifier).state = true;
      } else {
        _scheduleRebuild(read);
      }
    });
  }
}

class _WeatherList extends ConsumerWidget {
  _WeatherList({
    Key? key,
    required this.tiles,
    required this.loadedStatus,
  }) : super(key: key);

  final List<WeatherTile> tiles;
  final List<bool> loadedStatus;
  final _timerController = StateController<Timer>(Timer(Duration.zero, () {}));
  final _refreshInterval = const Duration(minutes: 60);
  late final _loadedProvider = StateProvider((_) => _isFullyLoaded);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(weatherOrderProvider);
    if (order == WeatherOrder.byTemp) {
      if (_isFullyLoaded) {
        if (!_timerController.state.isActive) {
          _setPeriodicRefresh(ref);
        }
      } else {
        ref.watch(_loadedProvider);
        _scheduleRebuild(ref.read);
      }
    }
    return RefreshIndicator(
      onRefresh: () => _refresh(ref),
      child: ListView(
        padding: const EdgeInsets.only(bottom: 48, top: 8),
        children: _sort(ref.read, order),
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

  bool get _isFullyLoaded => loadedStatus.every((value) => value);

  void _scheduleRebuild(Reader read) {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_isFullyLoaded) {
        read(_loadedProvider.notifier).state = true;
      } else {
        _scheduleRebuild(read);
      }
    });
  }

  List<Widget> _sort(Reader read, WeatherOrder order) {
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
