import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../domain/entity/weather/city.dart';
import '../../../../../domain/entity/weather/current_weather.dart';
import '../../../../../domain/entity/weather/weather.dart';
import '../../../../../domain/provider/providers.dart';
import '../../../../common/widget/cut_and_flip_ad.dart';
import '../../../../feature/settings/widget/open_end_drawer_button.dart';
import '../../widget/color_range_mixin.dart';
import '../../widget/temperature_gradient_box_hero.dart';
import '../../widget/temperature_mixin.dart';
import '../../widget/weather_title_hero.dart';
import 'one_call_weather_refresh_button.dart';
import 'time_and_weather_bar.dart';

class OneCallWeatherContainerAppAndTitleBar extends ConsumerWidget {
  const OneCallWeatherContainerAppAndTitleBar({
    super.key,
    required this.city,
    required this.initialWeather,
    required this.isRefreshing,
    required this.child,
  });

  final Size preferredSize = const Size.fromHeight(120);

  final City city;
  final CurrentWeather initialWeather;
  final bool isRefreshing;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(currentWeatherByLocationAutoRefreshProvider(city.location!));
    return asyncValue.maybeWhen(
      data: (data) => _OneCallWeatherAppAndTitleBar(
        height: preferredSize.height + appWindow.titleBarHeight,
        city: city,
        weather: data.weather,
        isRefreshing: asyncValue.isRefreshing || isRefreshing,
        child: child,
      ),
      orElse: () => _OneCallWeatherAppAndTitleBar(
        height: preferredSize.height,
        city: city,
        weather: initialWeather.weather,
        isRefreshing: isRefreshing,
        child: child,
      ),
    );
  }
}

class _OneCallWeatherAppAndTitleBar extends StatelessWidget with ColorRangeMixin, TemperatureMixin {
  _OneCallWeatherAppAndTitleBar({
    required this.height,
    required this.city,
    required this.weather,
    required this.isRefreshing,
    required this.child,
  });

  final double height;
  final City city;
  final Weather weather;
  final bool isRefreshing;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: height,
          child: Stack(
            children: [
              TemperatureGradientBoxHero(city: city, gradient: _gradient(context)),
              Column(
                children: [
                  _titleBar(context),
                  _timeAndWeatherBar(context),
                ],
              ),
            ],
          ),
        ),
        Expanded(child: child),
      ],
    );
  }

  Widget _titleBar(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          _backButton,
          _dragTitle(context),
          _trailingControls(context),
        ],
      ),
    );
  }

  Widget get _backButton => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: BackButton(),
      );

  Widget _dragTitle(BuildContext context) => Expanded(
        child: GestureDetector(
          onPanStart: (_) => appWindow.startDragging(),
          child: WeatherTitleHero(
            city: city,
            showCountry: false,
            style: _titleStyle(context),
            maxLines: 2,
          ),
        ),
      );

  Widget _trailingControls(BuildContext context) {
    final windowButtonColors = WindowButtonColors(iconNormal: Colors.white);
    final closeButtonColors = WindowButtonColors(
      mouseOver: const Color(0xFFD32F2F),
      mouseDown: const Color(0xFFB71C1C),
      iconNormal: const Color(0xFFFFFFFF),
      iconMouseOver: const Color(0xFFFFFFFF),
    );
    final windowButtons = Container(
      color: _buttonsBgColor(context),
      height: appWindow.titleBarHeight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MinimizeWindowButton(colors: windowButtonColors),
          MaximizeWindowButton(colors: windowButtonColors),
          CloseWindowButton(colors: closeButtonColors),
        ],
      ),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        windowButtons,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            OneCallWeatherRefreshButton(city: city),
            const OpenEndDrawerButton(),
          ],
        ),
      ],
    );
  }

  Color? _buttonsBgColor(BuildContext context) => Colors.black54;

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
    return Padding(
      padding: const EdgeInsets.all(8),
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
    );
  }

  Gradient _gradient(BuildContext context) => temperatureGradient(
        startColor: Theme.of(context).colorScheme.surfaceVariant,
        celcius: weather.conditions.temperatures.temperature,
        begin: const Alignment(-0.5, -1.5),
        end: Alignment.bottomRight,
      );
}
