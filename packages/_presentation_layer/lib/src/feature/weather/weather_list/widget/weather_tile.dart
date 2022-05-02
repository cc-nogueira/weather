import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:tuple/tuple.dart';

import '../../../../routes/routes.dart';
import '../../widget/gradient_box.dart';
import '../../widget/temperature_widget.dart';
import '../../widget/time_widget.dart';
import '../../widget/weather_conditions_widget.dart';
import '../../widget/weather_icon.dart';
import '../../widget/weather_title_widget.dart';
import '../../widget/weather_widget_mixin.dart';

class TemperatureNotifier extends StateNotifier<Celcius?> {
  TemperatureNotifier() : super(null);

  void onWeatherData(Weather weather) {
    state = weather.conditions.temperatures.temperature;
  }

  @override
  bool updateShouldNotify(Celcius? old, Celcius? current) => old?.value != current?.value;
}

class WeatherTile extends ConsumerWidget {
  WeatherTile({
    Key? key,
    required this.city,
    required this.onRemove,
  }) : super(key: key);

  final City city;
  final VoidCallback onRemove;
  final temperatureNotifierProvider =
      StateNotifierProvider<TemperatureNotifier, Celcius?>((_) => TemperatureNotifier());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = city.location;
    if (location == null) {
      return Container();
    }
    final temperatureUnit = ref.watch(temperatureUnitProvider);
    final windSpeedUnit = ref.watch(windSpeedUnitProvider);

    final tile = ref.watch(currentWeatherByLocationAutoRefreshProvider(location)).when(
          loading: () => _WeatherLoadingTile(
            city: city,
            onRemove: onRemove,
            onTap: () => {},
          ),
          error: (_, __) => _WeatherErrorTile(
            city: city,
            onRemove: onRemove,
            onTap: () {},
          ),
          data: (data) {
            _updateTemperature(ref.read, data.weather);
            return _WeatherTile(
              city: city,
              weather: data.weather,
              temperatureUnit: temperatureUnit,
              windSpeedUnit: windSpeedUnit,
              onRemove: onRemove,
              onTap: () => _onTap(context, data.weather),
            );
          },
        );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Slidable(
        key: ObjectKey(city),
        endActionPane: ActionPane(
          motion: const BehindMotion(),
          extentRatio: 0.25,
          children: [_slideTrashAction],
          dismissible: DismissiblePane(onDismissed: onRemove),
        ),
        child: tile,
      ),
    );
  }

  SlidableAction get _slideTrashAction => SlidableAction(
        onPressed: (_) => onRemove(),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: 'Excluir',
      );

  void _updateTemperature(Reader read, Weather weather) {
    Future.delayed(const Duration(milliseconds: 10), () {
      read(temperatureNotifierProvider.notifier).onWeatherData(weather);
    });
  }

  void _onTap(BuildContext context, Weather weather) {
    Navigator.pushNamed(context, Routes.weather, arguments: Tuple2(city, weather));
  }
}

abstract class _WeatherTileBase extends StatelessWidget {
  const _WeatherTileBase({
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
    var defaultColor = theme.colorScheme.onSurface;
    if (theme.brightness == Brightness.light && defaultColor.opacity == 1.0) {
      defaultColor = defaultColor.withOpacity(0.8);
    }
    return WeatherTitleWidget(
      city: city,
      style: textTheme.headline5!.copyWith(
        fontWeight: FontWeight.w500,
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

class _WeatherLoadingTile extends _WeatherTileBase {
  const _WeatherLoadingTile({
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

class _WeatherErrorTile extends _WeatherTileBase {
  const _WeatherErrorTile({
    Key? key,
    required City city,
    required VoidCallback onRemove,
    required VoidCallback onTap,
  }) : super(key: key, city: city, onRemove: onRemove, onTap: onTap);

  @override
  Widget trailing(BuildContext context) => WeatherIcon(city: city, weatherCode: -1, size: 60);

  @override
  Widget subtitle(BuildContext context) => const Text('No weather information');
}

class _WeatherTile extends _WeatherTileBase with WeatherWidgetMixin {
  const _WeatherTile({
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TemperatureWidget(city: city, weather: weather),
            TimeWidget(city),
          ],
        ),
        IconTheme.merge(
          data: iconThemeData,
          child: weatherIcon(city, weather),
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
        WeatherConditionsWidget(city: city, weather: weather),
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
  Widget weatherDecorated(BuildContext context, Widget child) => Stack(
        children: [
          GradientBox(
            city: city,
            gradient: temperatureGradient(
              startColor: Theme.of(context).colorScheme.surface,
              celcius: weather.conditions.temperatures.temperature,
              begin: const Alignment(0.3, -2.8),
              end: Alignment.bottomRight,
            ),
          ),
          child,
        ],
      );
}
