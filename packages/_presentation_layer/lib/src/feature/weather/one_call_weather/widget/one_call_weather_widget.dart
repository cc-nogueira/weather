import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../widget/powered_by_widget.dart';
import '../../widget/weather_icon.dart';
import '../../widget/wind_mixin.dart';
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
          CurrentWeatherDetails(
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

class CurrentWeatherDetails extends ConsumerWidget {
  const CurrentWeatherDetails({Key? key, required this.city, required this.initialWeather})
      : super(key: key);

  final City city;
  final Weather initialWeather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeather = ref.watch(currentWeatherByLocationAutoRefreshProvider(city.location!));
    return currentWeather.maybeWhen(
      data: (data) => _CurrentWeatherDetails(weather: data.weather),
      orElse: () => _CurrentWeatherDetails(weather: initialWeather),
    );
  }
}

class _CurrentWeatherDetails extends ConsumerWidget with WindMixin {
  const _CurrentWeatherDetails({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final temperatureUnit = ref.watch(temperatureUnitProvider);
    final windSpeedUnit = ref.watch(windSpeedUnitProvider);

    final feelTemp = weather.conditions.temperatures.feelsLike.quantity.convertTo(temperatureUnit);
    final minTemp = weather.conditions.temperatures.min?.quantity.convertTo(temperatureUnit);
    final maxTemp = weather.conditions.temperatures.max?.quantity.convertTo(temperatureUnit);

    final minString =
        minTemp == null ? '---' : '${minTemp.amount.round()} ${temperatureUnit.symbol}';
    final maxString =
        maxTemp == null ? '---' : '${maxTemp.amount.round()} ${temperatureUnit.symbol}';

    final elements = [
      _detailTile(
        context,
        mainAxisAlignment: MainAxisAlignment.start,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: WeatherIcon.thermometer(28),
        ),
        title: 'feels like',
        value: '${feelTemp.amount.toStringAsFixed(1)} ${temperatureUnit.symbol}',
      ),
      _detailTile(context, title: 'min', value: minString),
      _detailTile(context, title: 'max', value: maxString),
      _detailTile(
        context,
        mainAxisAlignment: MainAxisAlignment.start,
        leading: const Padding(
          padding: EdgeInsets.only(left: 24.0, right: 4.0),
          child: Icon(Icons.air),
        ),
        title: 'wind',
        value: _windSpeed(weather.conditions.wind.speedQuantity, windSpeedUnit),
      ),
      _detailTile(
        context,
        title: 'gust',
        value: _windSpeed(weather.conditions.wind.gustQuantity, windSpeedUnit),
      ),
      _detailTile(
        context,
        leading: WindIcon(degree: weather.conditions.wind.directionTo, size: 20),
        title: windDirectionLabel(weather.conditions.wind) + '  ',
        value: '${weather.conditions.wind.directionFrom} °',
      ),
    ];
    final gridWidth = MediaQuery.of(context).size.width;
    const desiredHeight = 140;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: gridWidth,
              child: GridView.count(
                childAspectRatio: gridWidth / desiredHeight,
                shrinkWrap: true,
                children: elements,
                crossAxisCount: 3,
                primary: false,
              ),
            ),
          ],
        ),
        Container(
          height: 12.0,
          color: Theme.of(context).brightness == Brightness.light ? Colors.white54 : Colors.black26,
        ),
      ],
    );
  }

  Widget _detailTile(
    BuildContext context, {
    Widget? leading,
    String? title,
    required String value,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
  }) {
    const bold = TextStyle(fontWeight: FontWeight.bold);
    final textTile = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (title != null) Text(title),
        Text(value, style: bold),
      ],
    );
    final child = (leading == null)
        ? textTile
        : Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [leading, textTile],
          );
    return Container(
      color: Theme.of(context).brightness == Brightness.light ? Colors.white54 : Colors.black26,
      child: child,
    );
  }

  String _windSpeed(Quantity<Speed>? speed, Unit<Speed> windSpeedUnit) {
    if (speed == null) {
      return '---';
    }
    final converted = speed.convertTo(windSpeedUnit);
    return '${converted.amount.round()} ${converted.unit.symbol}';
  }
}
