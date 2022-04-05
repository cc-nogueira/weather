import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon(
      {Key? key, required this.weatherCode, required this.size, this.day})
      : super(key: key);

  static Widget thermometer(double size, [Color? color]) =>
      BoxedIcon(WeatherIcons.thermometer, size: size / 1.5, color: color);

  static Widget wind(double size, [Color? color]) =>
      BoxedIcon(WeatherIcons.wind, size: size / 1.5, color: color);

  final int weatherCode;
  final bool? day;
  final double size;

  @override
  Widget build(BuildContext context) {
    final index = day == null ? 0 : (day! ? 1 : 2);
    final iconKeys = openWeatherToWeatherIconsMap[weatherCode];
    final IconData icon = (iconKeys == null)
        ? WeatherIcons.na
        : WeatherIcons.fromString('wi-${iconKeys[index]}',
            fallback: WeatherIcons.na);
    return BoxedIcon(icon, size: size / 1.5);
  }

  static const Map<int, List<String>> openWeatherToWeatherIconsMap = {
    200: ['thunderstorm', 'day-thunderstorm', 'night-alt-thunderstorm'],
    201: ['thunderstorm', 'day-thunderstorm', 'night-alt-thunderstorm'],
    202: ['thunderstorm', 'day-thunderstorm', 'night-alt-thunderstorm'],
    210: ['lightning', 'day-lightning', 'night-alt-lightning'],
    211: ['lightning', 'day-lightning', 'night-alt-lightning'],
    212: ['lightning', 'day-lightning', 'night-alt-lightning'],
    221: ['lightning', 'day-lightning', 'night-alt-lightning'],
    230: ['thunderstorm', 'day-thunderstorm', 'night-alt-thunderstorm'],
    231: ['thunderstorm', 'day-thunderstorm', 'night-alt-thunderstorm'],
    232: ['thunderstorm', 'day-thunderstorm', 'night-alt-thunderstorm'],
    300: ['sprinkle', 'day-sprinkle', 'night-alt-sprinkle'],
    301: ['sprinkle', 'day-sprinkle', 'night-alt-sprinkle'],
    302: ['rain', 'day-rain', 'night-alt-rain'],
    310: ['rain-mix', 'day-day-rain-mix', 'night-alt-day-rain-mix'],
    311: ['rain', 'day-rain', 'night-alt-rain'],
    312: ['rain', 'day-rain', 'night-alt-rain'],
    313: ['showers', 'day-rain', 'night-alt-rain'],
    314: ['rain', 'day-rain', 'night-alt-rain'],
    321: ['sprinkle', 'day-sprinkle', 'night-alt-sprinkle'],
    500: ['sprinkle', 'day-sprinkle', 'night-alt-sprinkle'],
    501: ['rain', 'day-rain', 'night-alt-rain'],
    502: ['rain', 'day-rain', 'night-alt-rain'],
    503: ['rain', 'day-rain', 'night-alt-rain'],
    504: ['rain', 'day-rain', 'night-alt-rain'],
    511: ['rain-mix', 'day-day-rain-mix', 'night-alt-day-rain-mix'],
    520: ['showers', 'day-showers', 'night-alt-showers'],
    521: ['showers', 'day-showers', 'night-alt-showers'],
    522: ['showers', 'day-showers', 'night-alt-showers'],
    531: ['storm-showers', 'day-storm-showers', 'night-alt-storm-showers'],
    600: ['snow', 'day-snow', 'night-alt-snow'],
    601: ['sleet', 'day-sleet', 'night-alt-sleet'],
    602: ['snow', 'day-snow', 'night-alt-snow'],
    611: ['rain-mix', 'day-rain-mix', 'night-alt-rain-mix'],
    612: ['rain-mix', 'day-rain-mix', 'night-alt-rain-mix'],
    615: ['rain-mix', 'day-rain-mix', 'night-alt-rain-mix'],
    616: ['rain-mix', 'day-rain-mix', 'night-alt-rain-mix'],
    620: ['rain-mix', 'day-rain-mix', 'night-alt-rain-mix'],
    621: ['snow', 'day-snow', 'night-alt-snow'],
    622: ['snow', 'day-snow', 'night-alt-snow'],
    701: ['showers', 'day-showers', 'night-alt-showers'],
    711: ['smoke', 'smoke', 'smoke'],
    721: ['day-haze', 'day-haze', 'day-haze'],
    731: ['dust', 'dust', 'dust'],
    741: ['fog', 'day-fog', 'night-alt-fog'],
    751: ['cloudy-gusts', 'day-cloudy-gusts', 'night-alt-cloudy-gusts'],
    761: ['dust', 'dust', 'dust'],
    762: ['dust', 'dust', 'dust'],
    771: ['cloudy-gusts', 'day-cloudy-gusts', 'night-alt-cloudy-gusts'],
    781: ['tornado', 'tornado', 'tornado'],
    800: ['day-sunny', 'day-sunny', 'night-clear'],
    801: ['cloudy-gusts', 'day-cloudy-gusts', 'night-alt-cloudy-gusts'],
    802: ['cloudy-gusts', 'day-cloudy-gusts', 'night-alt-cloudy-gusts'],
    803: ['cloudy-gusts', 'day-cloudy-gusts', 'night-alt-cloudy-gusts'],
    804: ['cloudy', 'day-sunny-overcast', 'night-alt-cloudy'],
    900: ['tornado', 'tornado', 'tornado'],
    901: ['storm-showers', 'day-storm-showers', 'night-alt-storm-showers'],
    902: ['hurricane', 'hurricane', 'hurricane'],
    903: ['snowflake-cold', 'snowflake-cold', 'snowflake-cold'],
    904: ['hot', 'hot', 'hot'],
    905: ['windy', 'windy', 'windy'],
    906: ['hail', 'day-hail', 'night-alt-hail'],
    951: ['day-sunny', 'day-sunny', 'night-clear'],
    952: ['cloudy-gusts', 'day-cloudy-gusts', 'night-alt-cloudy-gusts'],
    953: ['cloudy-gusts', 'day-cloudy-gusts', 'night-alt-cloudy-gusts'],
    954: ['cloudy-gusts', 'day-cloudy-gusts', 'night-alt-cloudy-gusts'],
    955: ['cloudy-gusts', 'day-cloudy-gusts', 'night-alt-cloudy-gusts'],
    956: ['cloudy-gusts', 'day-cloudy-gusts', 'night-alt-cloudy-gusts'],
    957: ['strong-wind', 'strong-wind', 'strong-wind'],
    958: ['cloudy-gusts', 'day-cloudy-gusts', 'night-alt-cloudy-gusts'],
    959: ['cloudy-gusts', 'day-cloudy-gusts', 'night-alt-cloudy-gusts'],
    960: ['thunderstorm', 'day-thunderstorm', 'night-alt-thunderstorm'],
    961: ['thunderstorm', 'day-thunderstorm', 'night-alt-thunderstorm'],
    962: ['cloudy-gusts', 'day-cloudy-gusts', 'night-alt-cloudy-gusts'],
  };
}
