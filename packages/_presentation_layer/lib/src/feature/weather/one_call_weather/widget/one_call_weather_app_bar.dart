import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../settings/widget/preferences_button.dart';
import '../../widget/color_range_mixin.dart';
import '../../widget/temperature_gradient_box_hero.dart';
import '../../widget/temperature_hero.dart';
import '../../widget/temperature_mixin.dart';
import '../../widget/time_hero.dart';
import '../../widget/weather_conditions_hero.dart';
import '../../widget/weather_mixin.dart';
import '../../widget/weather_title_hero.dart';

class OneCallWeatherAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const OneCallWeatherAppBar(
      {Key? key, required this.city, required this.initialWeather, required this.isRefreshing})
      : super(key: key);

  @override
  final Size preferredSize = const Size.fromHeight(120);

  final City city;
  final Weather initialWeather;
  final bool isRefreshing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(currentWeatherByLocationAutoRefreshProvider(city.location!));
    return asyncValue.maybeWhen(
      data: (data) => _WeatherAppBar(
        city: city,
        weather: data.weather,
        isRefreshing: asyncValue.isRefreshing || isRefreshing,
      ),
      orElse: () => _WeatherAppBar(city: city, weather: initialWeather, isRefreshing: isRefreshing),
    );
  }
}

class _WeatherAppBar extends StatelessWidget with ColorRangeMixin, TemperatureMixin {
  _WeatherAppBar({
    Key? key,
    required this.city,
    required this.weather,
    required this.isRefreshing,
  }) : super(key: key);

  final City city;
  final Weather weather;
  final bool isRefreshing;

  @override
  Widget build(BuildContext context) => AppBar(
        foregroundColor: _foreColor(context),
        title: WeatherTitleHero(city: city, style: _titleStyle(context)),
        actions: const [PreferencesButton()],
        flexibleSpace: FlexibleSpaceBar(background: _background(context)),
      );

  TextStyle _titleStyle(BuildContext context) {
    final theme = Theme.of(context);
    return theme.appBarTheme.titleTextStyle ??
        theme.textTheme.headline6!.copyWith(color: _foreColor(context));
  }

  Color _foreColor(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.appBarTheme.foregroundColor ?? theme.colorScheme.onSurface;
    if (theme.brightness == Brightness.dark || color.opacity != 1.0) {
      return color;
    }
    return color.withOpacity(0.7);
  }

  Widget _background(BuildContext context) {
    return Stack(
      children: [
        TemperatureGradientBoxHero(city: city, gradient: _gradient(context)),
        Padding(
          padding: const EdgeInsets.only(top: 72.0),
          child: _TimeAndWeatherBar(
            city: city,
            weather: weather,
            isRefreshing: isRefreshing,
          ),
        ),
      ],
    );
  }

  Gradient _gradient(BuildContext context) => temperatureGradient(
        startColor: Theme.of(context).colorScheme.surface,
        celcius: weather.conditions.temperatures.temperature,
        begin: const Alignment(-0.5, -1.5),
        end: Alignment.bottomRight,
      );
}

class _TimeAndWeatherBar extends StatelessWidget with WeatherMixin {
  const _TimeAndWeatherBar({
    Key? key,
    required this.city,
    required this.weather,
    required this.isRefreshing,
  }) : super(key: key);

  final City city;
  final Weather weather;
  final bool isRefreshing;

  @override
  Widget build(BuildContext context) {
    final leading = Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: TimeHero(city, fontSize: 32.0),
    );
    final trailing = Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [trailing1(context), trailing2(context)],
      ),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [leading, trailing],
    );
  }

  Widget trailing1(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TemperatureHero(city: city, weather: weather),
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: WeatherConditionsHero(city: city, weather: weather),
        ),
      ],
    );
  }

  Widget trailing2(BuildContext context) =>
      isRefreshing ? loadingIndicator : heroWeatherIcon(city, weather);

  Widget get loadingIndicator => const SizedBox(
        height: 60,
        width: 60,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: CircularProgressIndicator(color: Colors.grey),
        ),
      );

  Color? textColor(ThemeData theme, ListTileThemeData tileTheme) {
    final defaultColor = theme.textTheme.subtitle1!.color;
    return tileTheme.textColor ?? theme.listTileTheme.textColor ?? defaultColor;
  }

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
