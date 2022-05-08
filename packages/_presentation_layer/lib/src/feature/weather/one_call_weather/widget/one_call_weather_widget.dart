import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widget/powered_by_widget.dart';
import 'current_weather_widget.dart';
import 'hourly_rain_and_temperature_chart.dart';
import 'hourly_rain_chart.dart';
import 'hourly_temperature_chart.dart';
import 'hourly_wind_chart.dart';

class OneCallWeatherWidget extends ConsumerWidget {
  const OneCallWeatherWidget({Key? key, required this.city, required this.oneCallWeather})
      : super(key: key);

  final City city;
  final OneCallWeather oneCallWeather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final combineRainAndTemp = ref.watch(combineRainAndTemperatureProvider);
    // return RefreshIndicator(
    //   onRefresh: () => _refresh(ref),
    //   child:
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView(
        children: [
          CurrentWeatherWidget(
            city: city,
            initialWeather: oneCallWeather.weather,
          ),
          Container(height: 20, color: Colors.black87),
          //HourlyWeatherChart(weather: oneCallWeather),
          if (!combineRainAndTemp) HourlyTemperatureChart(weather: oneCallWeather),
          if (!combineRainAndTemp) HourlyRainChart(weather: oneCallWeather),
          if (combineRainAndTemp) HourlyRainAndTemperatureChart(weather: oneCallWeather),
          HourlyWindChart(weather: oneCallWeather),
          _poweredByWidget,
        ],
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

  // Future<void> _refresh(WidgetRef ref) {
  //   ref.invalidate(oneCallWeatherTupleByLocationProvider(city.location!));
  //   ref.invalidate(oneCallWeatherByLocationAutoEvictProvider(city.location!));
  //   return Future.value();
  // }
}
