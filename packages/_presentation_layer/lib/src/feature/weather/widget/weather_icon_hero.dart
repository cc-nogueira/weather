import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';

import 'weather_icons.dart';

class WeatherIconHero extends StatelessWidget {
  const WeatherIconHero(
      {Key? key, required this.city, required this.weatherCode, required this.size, this.isDayTime})
      : super(key: key);

  final City city;
  final int weatherCode;
  final bool? isDayTime;
  final double size;

  @override
  Widget build(BuildContext context) => Hero(
        tag: '${city.id}_weatherIcon',
        child: WeatherIcons.forOpenWeather(
          openWeatherCode: weatherCode,
          size: size,
          isDayTime: isDayTime,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      );
}
