import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widget/powered_by_widget.dart';
import '../helper/one_call_weather_stats.dart';
import 'alerts_widget.dart';
import 'current_weather_widget.dart';
import 'daily_weather_chart.dart';
import 'hourly_rain_chart.dart';
import 'hourly_snow_chart.dart';
import 'hourly_temperature_chart.dart';
import 'hourly_wind_chart.dart';
import 'no_precipitation_chart.dart';
import 'one_call_weather_refresh_mixin.dart';

class OneCallWeatherWidget extends ConsumerWidget with OneCallWeatherRefreshMixin {
  const OneCallWeatherWidget({super.key, required this.city, required this.oneCallWeather});

  final City city;
  final OneCallWeather oneCallWeather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = OneCallWeatherStats(oneCallWeather);

    bool hideRain = false;
    bool hideSnow = false;
    bool noPrecipitation = false;
    hideSnow = !stats.hasSnow;
    hideRain = !stats.hasRain;
    if (!hideRain && !hideSnow) {
      if (stats.minTemp.value > 7.0) {
        hideSnow = true;
      } else if (stats.maxTemp.value < -2.0) {
        hideRain = true;
      }
    }
    if (hideRain && hideSnow) {
      noPrecipitation = true;
    }

    final messenger = ScaffoldMessenger.of(context);
    return RefreshIndicator(
      onRefresh: () => refresh(ref, messenger, city.location!),
      child: ListView(
        children: [
          CurrentWeatherWidget(city: city, initialWeather: oneCallWeather.weather, stats: stats),
          Container(height: 12, color: Colors.black87),
          if (oneCallWeather.alerts.isNotEmpty) AlertsWidget(weather: oneCallWeather),
          Container(height: 8, color: Colors.black87),
          DailyWeatherChart(
            weather: oneCallWeather,
            margin: const EdgeInsets.only(bottom: 10.0),
          ),
          HourlyTemperatureChart(weather: oneCallWeather, stats: stats),
          if (!hideRain) HourlyRainChart(weather: oneCallWeather, stats: stats),
          if (!hideSnow) HourlySnowChart(weather: oneCallWeather, stats: stats),
          if (noPrecipitation) NoPrecipitationChart(weather: oneCallWeather, stats: stats),
          HourlyWindChart(weather: oneCallWeather, stats: stats),
          _poweredByWidget,
        ],
      ),
    );
  }

  Widget get _poweredByWidget {
    return Container(
      margin: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0, top: 16.0),
      padding: const EdgeInsets.symmetric(vertical: 16),
      color: const Color(0xFF050505),
      child: const PoweredByWidget(),
    );
  }
}
