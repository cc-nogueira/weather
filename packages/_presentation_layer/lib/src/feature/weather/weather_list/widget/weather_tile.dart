import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:tuple/tuple.dart';

import '../../../../routes/routes.dart';
import '../../widget/time_widget.dart';
import '../../widget/weather_icon.dart';
import '../../widget/weather_widget_mixin.dart';

class WeatherTile extends ConsumerWidget {
  const WeatherTile({
    Key? key,
    required this.city,
    required this.onRemove,
    required this.onLoaded,
  }) : super(key: key);

  final City city;
  final VoidCallback onRemove;
  final VoidCallback onLoaded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = city.location;
    if (location == null) {
      return Container();
    }
    final temperatureUnit = ref.watch(temperatureUnitProvider);
    final windSpeedUnit = ref.watch(windSpeedUnitProvider);
    final cache = ref.read(weatherCacheProvider);
    final weatherCache = cache[location]?.weather;

    final tile = ref.watch(weatherContainerByLocationProvider(location)).when(
          loading: () => weatherCache == null
              ? _WeatherLoadingWidget(
                  city: city,
                  onRemove: onRemove,
                  onTap: () => {},
                )
              : _WeatherWidget(
                  city: city,
                  onRemove: onRemove,
                  onTap: () => onTap(context, weatherCache),
                  weather: weatherCache,
                  temperatureUnit: temperatureUnit,
                  windSpeedUnit: windSpeedUnit,
                ),
          error: (_, __) => _WeatherErrorWidget(
            city: city,
            onRemove: onRemove,
            onTap: () {},
          ),
          data: (data) {
            cache[location] = data;
            onLoaded();
            return _WeatherWidget(
              city: city,
              weather: data.weather,
              temperatureUnit: temperatureUnit,
              windSpeedUnit: windSpeedUnit,
              onRemove: onRemove,
              onTap: () => onTap(context, data.weather),
            );
          },
        );

    return Slidable(
      key: ObjectKey(city),
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        extentRatio: 0.25,
        children: [_slideTrashAction],
        dismissible: DismissiblePane(onDismissed: onRemove),
      ),
      child: tile,
    );
  }

  SlidableAction get _slideTrashAction => SlidableAction(
        onPressed: (_) => onRemove(),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: 'Excluir',
      );

  void refresh(WidgetRef ref) {
    final location = city.location;
    if (location != null) {
      ref.read(weatherCacheProvider).remove(location);
      ref.invalidate(currentWeatherByLocationProvider(location));
      ref.invalidate(oneCallWeatherByLocationProvider(location));
      ref.invalidate(weatherContainerByLocationProvider(location));
      ref.invalidate(timeZoneProvider(location));
    }
  }

  void onTap(BuildContext context, Weather weather) {
    Navigator.pushNamed(context, Routes.weather, arguments: Tuple2(city, weather));
  }
}

abstract class _WeatherWidgetBase extends StatelessWidget {
  const _WeatherWidgetBase({
    Key? key,
    required this.city,
    required this.onRemove,
    required this.onTap,
  }) : super(key: key);

  final City city;
  final VoidCallback onRemove;
  final VoidCallback onTap;

  Widget trailing(BuildContext context);
  Widget subtitle(BuildContext context);
  Widget? details(BuildContext context) => null;

  @override
  Widget build(BuildContext context) {
    final decoratedTile = weatherDecorated(context, tile(context));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: decoratedTile,
      ),
    );
  }

  Widget weatherDecorated(BuildContext context, Widget child) => child;

  Widget tile(BuildContext context) {
    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title(context),
        subtitle(context),
      ],
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [info, trailing(context)],
      ),
    );
  }

  Widget title(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final listTileTheme = ListTileTheme.of(context);
    final defaultColor = textTheme.subtitle1!.color;
    return Text(
      city.name,
      style: textTheme.headline5!.copyWith(
        color: textColor(theme, listTileTheme, defaultColor),
      ),
    );
  }

  Color? textColor(ThemeData theme, ListTileThemeData tileTheme, Color? defaultColor) =>
      tileTheme.textColor ?? theme.listTileTheme.textColor ?? defaultColor;

  Color? iconColor(ThemeData theme, ListTileThemeData tileTheme) {
    final Color? color = tileTheme.iconColor ?? theme.listTileTheme.iconColor;
    if (color != null) return color;

    switch (theme.brightness) {
      case Brightness.light:
        return Colors.black45;
      case Brightness.dark:
        return null; // null - use current icon theme color
    }
  }
}

class _WeatherLoadingWidget extends _WeatherWidgetBase {
  const _WeatherLoadingWidget({
    Key? key,
    required City city,
    required VoidCallback onRemove,
    required VoidCallback onTap,
  }) : super(key: key, city: city, onRemove: onRemove, onTap: onTap);

  @override
  Widget trailing(BuildContext context) => const SizedBox(
        height: 60,
        width: 60,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: CircularProgressIndicator(color: Colors.grey),
        ),
      );

  @override
  Widget subtitle(BuildContext context) => const Text('Loading...');
}

class _WeatherErrorWidget extends _WeatherWidgetBase {
  const _WeatherErrorWidget({
    Key? key,
    required City city,
    required VoidCallback onRemove,
    required VoidCallback onTap,
  }) : super(key: key, city: city, onRemove: onRemove, onTap: onTap);

  @override
  Widget trailing(BuildContext context) => const WeatherIcon(weatherCode: -1, size: 60);

  @override
  Widget subtitle(BuildContext context) => const Text('No weather information');
}

class _WeatherWidget extends _WeatherWidgetBase with WeatherWidgetMixin {
  const _WeatherWidget({
    Key? key,
    required City city,
    required VoidCallback onRemove,
    required VoidCallback onTap,
    required this.weather,
    required this.temperatureUnit,
    required this.windSpeedUnit,
  }) : super(key: key, city: city, onRemove: onRemove, onTap: onTap);

  final Weather weather;
  final Unit<Speed> windSpeedUnit;
  final Unit<Temperature> temperatureUnit;

  @override
  Widget trailing(BuildContext context) {
    final theme = Theme.of(context);
    final ListTileThemeData tileTheme = ListTileTheme.of(context);
    final iconThemeData = IconThemeData(color: iconColor(theme, tileTheme));
    final tempSt = theme.textTheme.headline4;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${weather.conditions.temperatures.temperature.quantity.convertTo(temperatureUnit).amount.round()}',
              style: tempSt,
            ),
            TimeWidget(city.location!),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(temperatureUnit.symbol),
        ),
        IconTheme.merge(
          data: iconThemeData,
          child: weatherIcon(weather),
        ),
      ],
    );
  }

  @override
  Widget subtitle(BuildContext context) {
    const bold = TextStyle(fontWeight: FontWeight.bold);
    final theme = Theme.of(context);
    final tileTheme = ListTileTheme.of(context);
    final defaultColor = theme.textTheme.subtitle1!.color;
    final iconColor = textColor(theme, tileTheme, defaultColor);
    final convertedWindSpeed = weather.conditions.wind.speedQuantity.convertTo(windSpeedUnit);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${weather.conditions.title} (${weather.conditions.description})'),
        Row(
          children: [
            windIcon(weather.conditions.wind, size: 20, color: iconColor),
            const SizedBox(width: 4),
            Text(windDirectionLabel(weather.conditions.wind), style: bold),
            const SizedBox(width: 4),
            Text('${convertedWindSpeed.amount.round()}', style: bold),
            const SizedBox(width: 4),
            Text(convertedWindSpeed.unit.symbol),
          ],
        ),
      ],
    );
  }

  @override
  Widget weatherDecorated(BuildContext context, Widget child) => DecoratedBox(
        decoration: BoxDecoration(
          gradient: temperatureGradient(
            startColor: Theme.of(context).colorScheme.surface,
            celcius: weather.conditions.temperatures.temperature,
            begin: const Alignment(0.3, -2.8),
            end: Alignment.bottomRight,
          ),
        ),
        child: child,
      );
}
