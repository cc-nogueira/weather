import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:tuple/tuple.dart';

import '../../../../../domain_layer.dart';
import '../../../../app/routes/routes.dart';
import '../../../../l10n/translations.dart';
import '../../widget/color_range_mixin.dart';
import '../../widget/temperature_gradient_box_hero.dart';
import '../../widget/temperature_hero.dart';
import '../../widget/temperature_mixin.dart';
import '../../widget/time_hero.dart';
import '../../widget/weather_conditions_hero.dart';
import '../../widget/weather_icon_hero.dart';
import '../../widget/weather_mixin.dart';
import '../../widget/weather_title_hero.dart';
import '../../widget/wind_mixin.dart';

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
    super.key,
    required this.translations,
    required this.city,
    required this.onRemove,
    required this.showCountry,
  });

  final Translations translations;
  final City city;
  final bool showCountry;
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

    final asyncValue = ref.watch(currentWeatherByLocationAutoRefreshProvider(location));
    final tile = asyncValue.when(
      loading: () => _WeatherLoadingTile(
        translations: translations,
        city: city,
        showCountry: showCountry,
        onRemove: onRemove,
        onTap: () => {},
      ),
      error: (_, __) => _WeatherErrorTile(
        translations: translations,
        city: city,
        showCountry: showCountry,
        onRemove: onRemove,
        onTap: () {},
      ),
      data: (data) {
        _updateTemperature(ref, data.weather);
        return _WeatherTile(
          translations: translations,
          city: city,
          cityName: data.name,
          showCountry: showCountry,
          weather: data.weather,
          isRefreshing: asyncValue.isRefreshing,
          temperatureUnit: temperatureUnit,
          windSpeedUnit: windSpeedUnit,
          onRemove: onRemove,
          onTap: () => _onTap(context, data),
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
          dismissible: DismissiblePane(onDismissed: onRemove),
          children: [_slideTrashAction],
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
        label: translations.label_remove,
      );

  void _updateTemperature(WidgetRef ref, Weather weather) {
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(temperatureNotifierProvider.notifier).onWeatherData(weather);
    });
  }

  void _onTap(BuildContext context, CurrentWeather weather) {
    Navigator.pushNamed(context, Routes.weather, arguments: Tuple2(city, weather));
  }
}

abstract class _WeatherTileBase extends StatelessWidget {
  const _WeatherTileBase({
    required this.translations,
    required this.city,
    required this.cityName,
    required this.showCountry,
    required this.onRemove,
    required this.onTap,
  });

  final Translations translations;
  final String cityName;
  final City city;
  final bool showCountry;
  final VoidCallback onRemove;
  final VoidCallback onTap;

  Widget trailing(BuildContext context);
  Widget subtitle(BuildContext context);
  Widget? details(BuildContext context) => null;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GestureDetector(
          onTap: onTap,
          child: weatherDecorated(context, tile(context)),
        ),
      );

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
      padding: const EdgeInsets.only(left: 16.0, top: 12.0, right: 8.0, bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Expanded(child: info), trailing(context)],
      ),
    );
  }

  Widget title(BuildContext context) => WeatherTitleHero(
        city: city,
        showCountry: showCountry,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
      );

  Widget get loadingIndicator => const SizedBox(
        height: 60,
        width: 60,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: CircularProgressIndicator(color: Colors.grey),
        ),
      );
}

class _WeatherLoadingTile extends _WeatherTileBase {
  _WeatherLoadingTile({
    required super.translations,
    required super.city,
    required super.showCountry,
    required super.onRemove,
    required super.onTap,
  }) : super(cityName: city.name);

  @override
  Widget trailing(BuildContext context) => loadingIndicator;

  @override
  Widget subtitle(BuildContext context) => Text(translations.message_loading);
}

class _WeatherErrorTile extends _WeatherTileBase {
  _WeatherErrorTile({
    required super.translations,
    required super.city,
    required super.showCountry,
    required super.onRemove,
    required super.onTap,
  }) : super(cityName: city.name);

  @override
  Widget trailing(BuildContext context) => WeatherIconHero(city: city, weatherCode: -1, size: 60);

  @override
  Widget subtitle(BuildContext context) => Text(translations.message_no_weather_info);
}

class _WeatherTile extends _WeatherTileBase with ColorRangeMixin, WeatherMixin, WindMixin, TemperatureMixin {
  const _WeatherTile({
    required super.translations,
    required super.city,
    required super.cityName,
    required super.showCountry,
    required super.onRemove,
    required super.onTap,
    required this.weather,
    required this.isRefreshing,
    required this.temperatureUnit,
    required this.windSpeedUnit,
  });

  final Weather weather;
  final bool isRefreshing;
  final Unit<Speed> windSpeedUnit;
  final Unit<Temperature> temperatureUnit;

  @override
  Widget trailing(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TemperatureHero(city: city, weather: weather),
              TimeHero(city),
            ],
          ),
          isRefreshing ? loadingIndicator : heroWeatherIcon(city, weather),
        ],
      );

  @override
  Widget subtitle(BuildContext context) {
    const bold = TextStyle(fontWeight: FontWeight.bold);
    final colors = Theme.of(context).colorScheme;
    final convertedWindSpeed = weather.conditions.wind.speedQuantity.convertTo(windSpeedUnit);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WeatherConditionsHero(city: city, weather: weather),
        Row(
          children: [
            windIcon(weather.conditions.wind, size: 24, color: colors.onSurface),
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
          TemperatureGradientBoxHero(
            city: city,
            gradient: temperatureGradient(
              startColor: Theme.of(context).colorScheme.surfaceVariant,
              celcius: weather.conditions.temperatures.temperature,
              begin: const Alignment(0.3, -2.8),
              end: Alignment.bottomRight,
            ),
          ),
          child,
        ],
      );
}
