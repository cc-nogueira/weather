import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../domain_layer.dart';
import '../../../../common/widget/cut_and_flip_ad.dart';
import '../../../settings/widget/open_end_drawer_button.dart';
import '../../widget/color_range_mixin.dart';
import '../../widget/temperature_gradient_box_hero.dart';
import '../../widget/temperature_mixin.dart';
import '../../widget/weather_title_hero.dart';
import 'one_call_weather_refresh_button.dart';
import 'time_and_weather_bar.dart';

class OneCallWeatherAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const OneCallWeatherAppBar({
    super.key,
    required this.city,
    required this.initialWeather,
    required this.isRefreshing,
  });

  @override
  final Size preferredSize = const Size.fromHeight(120);

  final City city;
  final CurrentWeather initialWeather;
  final bool isRefreshing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(currentWeatherByLocationAutoRefreshProvider(city.location!));
    return asyncValue.maybeWhen(
      data: (data) => _WeatherAppBar(
        height: preferredSize.height,
        city: city,
        weather: data.weather,
        isRefreshing: asyncValue.isRefreshing || isRefreshing,
      ),
      orElse: () => _WeatherAppBar(
        height: preferredSize.height,
        city: city,
        weather: initialWeather.weather,
        isRefreshing: isRefreshing,
      ),
    );
  }
}

class _WeatherAppBar extends StatelessWidget with ColorRangeMixin, TemperatureMixin {
  _WeatherAppBar({
    required this.height,
    required this.city,
    required this.weather,
    required this.isRefreshing,
  });

  final double height;
  final City city;
  final Weather weather;
  final bool isRefreshing;

  @override
  Widget build(BuildContext context) {
    final systemBarHeight = MediaQuery.of(context).padding.top;
    return AppBar(
      leading: const BackButton(),
      foregroundColor: _foreColor(context),
      title: WeatherTitleHero(
        city: city,
        showCountry: false,
        style: _titleStyle(context),
      ),
      actions: [
        if (!Platform.isAndroid && !Platform.isIOS) OneCallWeatherRefreshButton(city: city),
        const OpenEndDrawerButton(),
      ],
      flexibleSpace: SizedBox(height: height + systemBarHeight, child: _timeAndWeatherBar(context)),
    );
  }

  TextStyle _titleStyle(BuildContext context) {
    final theme = Theme.of(context);
    return theme.appBarTheme.titleTextStyle ?? theme.textTheme.titleLarge!.copyWith(color: _foreColor(context));
  }

  Color _foreColor(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.appBarTheme.foregroundColor ?? theme.colorScheme.onSurface;
    if (theme.brightness == Brightness.dark || color.opacity != 1.0) {
      return color;
    }
    return color.withOpacity(0.7);
  }

  Widget _timeAndWeatherBar(BuildContext context) {
    final topPadding = (Platform.isAndroid || Platform.isAndroid) ? 72.0 : 48.0;
    return Stack(
      children: [
        TemperatureGradientBoxHero(city: city, gradient: _gradient(context)),
        Padding(
          padding: EdgeInsets.only(top: topPadding, left: 8, right: 8, bottom: 8),
          child: Center(
            child: CutAndFlipAd(
              startingCutLength: 65.0,
              child: TimeAndWeatherBar(
                city: city,
                weather: weather,
                isRefreshing: isRefreshing,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Gradient _gradient(BuildContext context) => temperatureGradient(
        startColor: Theme.of(context).colorScheme.surfaceVariant,
        celcius: weather.conditions.temperatures.temperature,
        begin: const Alignment(-0.5, -1.5),
        end: Alignment.bottomRight,
      );
}
