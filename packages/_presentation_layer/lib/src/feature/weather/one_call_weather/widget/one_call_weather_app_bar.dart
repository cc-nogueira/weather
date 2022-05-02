import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../settings/widget/preferences_button.dart';
import '../../widget/gradient_box.dart';
import '../../widget/temperature_widget.dart';
import '../../widget/time_widget.dart';
import '../../widget/weather_conditions_widget.dart';
import '../../widget/weather_title_widget.dart';
import '../../widget/weather_widget_mixin.dart';

class OneCallWeatherAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const OneCallWeatherAppBar({Key? key, required this.city, required this.initialWeather})
      : super(key: key);

  @override
  final Size preferredSize = const Size.fromHeight(120);

  final City city;
  final Weather initialWeather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeather = ref.watch(currentWeatherByLocationAutoRefreshProvider(city.location!));
    return currentWeather.maybeWhen(
      data: (data) => _WeatherAppBar(city: city, weather: data.weather),
      orElse: () => _WeatherAppBar(city: city, weather: initialWeather),
    );
  }
}

class _WeatherAppBar extends StatelessWidget with WeatherWidgetMixin {
  _WeatherAppBar({
    Key? key,
    required this.city,
    required this.weather,
  }) : super(key: key);

  final City city;
  final Weather weather;

  @override
  Widget build(BuildContext context) => AppBar(
        title: WeatherTitleWidget(city: city, style: _titleStyle(context)),
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
    return theme.appBarTheme.foregroundColor ??
        (theme.brightness == Brightness.light
            ? theme.colorScheme.onPrimary
            : theme.colorScheme.onSurface);
  }

  Widget _background(BuildContext context) {
    return Stack(
      children: [
        GradientBox(city: city, gradient: _gradient(context)),
        Padding(
          padding: const EdgeInsets.only(top: 72.0),
          child: _TimeAndWeatherBar(
            city: city,
            weather: weather,
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

class _TimeAndWeatherBar extends StatelessWidget with WeatherWidgetMixin {
  const _TimeAndWeatherBar({
    Key? key,
    required this.city,
    required this.weather,
  }) : super(key: key);

  final City city;
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final leading = Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: TimeWidget(city, color: colors.onPrimary, fontSize: 32.0),
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
        TemperatureWidget(city: city, weather: weather),
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: WeatherConditionsWidget(city: city, weather: weather),
        ),
      ],
    );
  }

  Widget trailing2(BuildContext context) {
    final theme = Theme.of(context);
    final ListTileThemeData tileTheme = ListTileTheme.of(context);
    final iconThemeData = IconThemeData(color: iconColor(theme, tileTheme));
    return IconTheme.merge(
      data: iconThemeData,
      child: SizedBox(
        height: 60.0,
        child: weatherIcon(city, weather),
      ),
    );
  }

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
