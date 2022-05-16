import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widget/powered_by_widget.dart';
import '../helper/one_call_weather_stats.dart';
import 'current_weather_widget.dart';
import 'hourly_rain_and_temperature_chart.dart';
import 'hourly_rain_chart.dart';
import 'hourly_snow_and_temperature_chart.dart';
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
    final combineTempToRainAndSnow = ref.watch(combineTemperatureToRainAndSnowProvider);
    final stats = OneCallWeatherStats(oneCallWeather);

    bool hideRain = false;
    bool hideSnow = false;
    bool noPrecipitation = false;
    hideSnow = !stats.hasSnow;
    hideRain = !stats.hasRain;
    if (!hideRain && !hideSnow) {
      if (stats.minTemp.value > 0.5) {
        hideSnow = true;
      } else if (stats.maxTemp.value < -0.5) {
        hideRain = true;
      }
    }
    if (hideRain && hideSnow) {
      noPrecipitation = true;
    }

    final messenger = ScaffoldMessenger.of(context);
    return RefreshIndicator(
      onRefresh: () => refresh(ref, messenger, city.location!),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView(
          children: [
            CurrentWeatherWidget(
              city: city,
              initialWeather: oneCallWeather.weather,
            ),
            Container(height: 20, color: Colors.black87),
            //HourlyWeatherChart(weather: oneCallWeather),
            HourlyTemperatureChart(weather: oneCallWeather, stats: stats),
            if (!hideRain)
              combineTempToRainAndSnow
                  ? HourlyRainAndTemperatureChart(weather: oneCallWeather, stats: stats)
                  : HourlyRainChart(weather: oneCallWeather, stats: stats),
            if (!hideSnow)
              combineTempToRainAndSnow
                  ? HourlySnowAndTemperatureChart(weather: oneCallWeather, stats: stats)
                  : HourlySnowChart(weather: oneCallWeather, stats: stats),
            if (noPrecipitation) NoPrecipitationChart(weather: oneCallWeather, stats: stats),
            HourlyWindChart(weather: oneCallWeather, stats: stats),
            _poweredByWidget,
          ],
        ),
      ),
    );
  }

  Widget get _poweredByWidget => DecoratedBox(
        decoration: const BoxDecoration(color: Colors.black87),
        child: Column(children: const [
          SizedBox(height: 40),
          Divider(),
          SizedBox(height: 20),
          PoweredByWidget(),
          SizedBox(height: 20),
        ]),
      );
}
