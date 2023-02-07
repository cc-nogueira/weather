import 'package:flutter/material.dart';

import '../../../../../domain/entity/weather/city.dart';
import '../../../../../domain/entity/weather/weather.dart';
import '../../widget/temperature_hero.dart';
import '../../widget/time_hero.dart';
import '../../widget/weather_conditions_hero.dart';
import '../../widget/weather_mixin.dart';

class TimeAndWeatherBar extends StatelessWidget with WeatherMixin {
  const TimeAndWeatherBar({
    super.key,
    required this.city,
    required this.weather,
    required this.isRefreshing,
  });

  final City city;
  final Weather weather;
  final bool isRefreshing;

  @override
  Widget build(BuildContext context) {
    final leading = Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: TimeHero(city, fontSize: 32.0),
    );
    final trailing = Padding(
      padding: const EdgeInsets.only(right: 8.0),
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

  Widget trailing2(BuildContext context) => isRefreshing ? loadingIndicator : heroWeatherIcon(city, weather);

  Widget get loadingIndicator => const SizedBox(
        height: 60,
        width: 60,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: CircularProgressIndicator(color: Colors.grey),
        ),
      );

  Color? textColor(ThemeData theme, ListTileThemeData tileTheme) {
    final defaultColor = theme.textTheme.titleMedium!.color;
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
