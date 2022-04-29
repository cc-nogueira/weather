import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../widget/weather_icon.dart';
import '../../widget/weather_widget_mixin.dart';

class OneCallWeatherWidget extends ConsumerWidget {
  const OneCallWeatherWidget({
    Key? key,
    required this.oneCallWeather,
  }) : super(key: key);

  final OneCallWeather oneCallWeather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final temperatureUnit = ref.watch(temperatureUnitProvider);
    final windSpeedUnit = ref.watch(windSpeedUnitProvider);
    return _OneCallWeatherWidget(
      oneCallWeather: oneCallWeather,
      temperatureUnit: temperatureUnit,
      windSpeedUnit: windSpeedUnit,
    );
  }
}

class _OneCallWeatherWidget extends StatelessWidget {
  const _OneCallWeatherWidget({
    Key? key,
    required this.oneCallWeather,
    required this.temperatureUnit,
    required this.windSpeedUnit,
  }) : super(key: key);

  final OneCallWeather oneCallWeather;
  final Unit<Temperature> temperatureUnit;
  final Unit<Speed> windSpeedUnit;

  @override
  Widget build(BuildContext context) => ListView(
        children: [
          _CurrentWeatherDetails(
            weather: oneCallWeather.weather,
            temperatureUnit: temperatureUnit,
            windSpeedUnit: windSpeedUnit,
          ),
          Card(
            child: Column(
              children: [
                const ListTile(
                  title: Text('Temperature'),
                  subtitle: Text('graph'),
                ),
                Container(decoration: const BoxDecoration(color: Colors.black), height: 140),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                const ListTile(
                  title: Text('Wind'),
                  subtitle: Text('graph'),
                ),
                Container(decoration: const BoxDecoration(color: Colors.black), height: 140),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                const ListTile(
                  title: Text('Forecast'),
                  subtitle: Text('graph'),
                ),
                Container(decoration: const BoxDecoration(color: Colors.black), height: 140),
              ],
            ),
          ),
        ],
      );
}

class _CurrentWeatherDetails extends StatelessWidget with WeatherWidgetMixin {
  const _CurrentWeatherDetails({
    Key? key,
    required this.weather,
    required this.windSpeedUnit,
    required this.temperatureUnit,
  }) : super(key: key);

  final Weather weather;
  final Unit<Speed> windSpeedUnit;
  final Unit<Temperature> temperatureUnit;

  @override
  Widget build(BuildContext context) {
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
        value: _windSpeed(weather.conditions.wind.speedQuantity),
      ),
      _detailTile(context, title: 'gust', value: _windSpeed(weather.conditions.wind.gustQuantity)),
      _detailTile(
        context,
        leading: WindIcon(degree: weather.conditions.wind.directionTo, size: 20),
        title: windDirectionLabel(weather.conditions.wind) + '  ',
        value: '${weather.conditions.wind.directionFrom} °',
      ),
    ];
    final gridWidth = MediaQuery.of(context).size.width - 20;
    const desiredHeight = 140;
    return Row(
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

  String _windSpeed(Quantity<Speed>? speed) {
    if (speed == null) {
      return '---';
    }
    final converted = speed.convertTo(windSpeedUnit);
    return '${converted.amount.round()} ${converted.unit.symbol}';
  }
}
