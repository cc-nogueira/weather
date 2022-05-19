import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';

import '../../widget/color_range_mixin.dart';
import '../../widget/weather_icons.dart';
import '../../widget/wind_mixin.dart';

class CurrentWeatherWidget extends ConsumerWidget {
  const CurrentWeatherWidget({super.key, required this.city, required this.initialWeather});

  final City city;
  final Weather initialWeather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeather = ref.watch(currentWeatherByLocationAutoRefreshProvider(city.location!));
    return currentWeather.maybeWhen(
      data: (data) => _CurrentWeatherWidget(weather: data.weather),
      orElse: () => _CurrentWeatherWidget(weather: initialWeather),
    );
  }
}

class _CurrentWeatherWidget extends ConsumerWidget with ColorRangeMixin, WindMixin {
  const _CurrentWeatherWidget({required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final temperatureUnit = ref.watch(temperatureUnitProvider);
    final windSpeedUnit = ref.watch(windSpeedUnitProvider);

    final feelTemp = weather.conditions.temperatures.feelsLike.quantity.convertTo(temperatureUnit);
    final minTemp = weather.conditions.temperatures.min?.quantity.convertTo(temperatureUnit);
    final maxTemp = weather.conditions.temperatures.max?.quantity.convertTo(temperatureUnit);

    final theme = Theme.of(context);
    final iconTheme = theme.iconTheme;
    final iconColor = iconTheme.color ?? theme.colorScheme.onSurface;

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
          child: WeatherIcons.instance.thermometer(28, iconColor),
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
        leading: Padding(
          padding: const EdgeInsets.only(right: 2.0),
          child: windIcon(weather.conditions.wind, size: 26, color: iconColor),
        ),
        title: '${windDirectionLabel(weather.conditions.wind)}  ',
        value: '${weather.conditions.wind.directionFrom} °',
      ),
    ];
    final gridWidth = MediaQuery.of(context).size.width;
    const desiredHeight = 140;
    return Container(
      color: theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: gridWidth,
                child: GridView.count(
                  childAspectRatio: gridWidth / desiredHeight,
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  primary: false,
                  children: elements,
                ),
              ),
            ],
          ),
          Container(
            height: 12.0,
            color:
                Theme.of(context).brightness == Brightness.light ? Colors.white54 : Colors.black26,
          ),
        ],
      ),
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
