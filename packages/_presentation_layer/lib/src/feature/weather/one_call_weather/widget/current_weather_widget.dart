import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';

import '../../../../l10n/translations.dart';
import '../../widget/color_range_mixin.dart';
import '../../widget/temperature_mixin.dart';
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

class _CurrentWeatherWidget extends ConsumerWidget
    with ColorRangeMixin, WindMixin, TemperatureMixin {
  const _CurrentWeatherWidget({required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = Translations.of(context)!;
    final temperatureUnit = ref.watch(temperatureUnitProvider);
    final windSpeedUnit = ref.watch(windSpeedUnitProvider);

    final feelTemp = weather.conditions.temperatures.feelsLike.quantity.convertTo(temperatureUnit);
    final minTemp = weather.conditions.temperatures.min?.quantity.convertTo(temperatureUnit);
    final maxTemp = weather.conditions.temperatures.max?.quantity.convertTo(temperatureUnit);

    final theme = Theme.of(context);
    final iconTheme = theme.iconTheme;
    final iconColor = iconTheme.color ?? theme.colorScheme.onSurface;

    final bold = theme.textTheme.headlineSmall!;

    final feelString = '${feelTemp.amount.round()} ${temperatureUnit.symbol}';
    final feelStyle =
        bold.copyWith(color: temperatureColor(weather.conditions.temperatures.feelsLike));

    final minString =
        minTemp == null ? '---' : '${minTemp.amount.round()} ${temperatureUnit.symbol}';
    final minStyle = minTemp == null
        ? bold
        : bold.copyWith(color: temperatureColor(weather.conditions.temperatures.min!));

    final maxString =
        maxTemp == null ? '---' : '${maxTemp.amount.round()} ${temperatureUnit.symbol}';
    final maxStyle = maxTemp == null
        ? bold
        : bold.copyWith(color: temperatureColor(weather.conditions.temperatures.max!));

    final windString = _windSpeed(weather.conditions.wind.speedQuantity, windSpeedUnit);
    final windStyle = bold.copyWith(color: windColor(weather.conditions.wind));

    final gustString = _windSpeed(weather.conditions.wind.gustQuantity, windSpeedUnit);
    final gustStyle = weather.conditions.wind.gust == null
        ? bold
        : bold.copyWith(color: gustColor(weather.conditions.wind));

    final elements = [
      _detailTile(
        context,
        title: Container(
          height: 24,
          alignment: Alignment.center,
          child: Text(translations.word_feels_like),
        ),
        value: Text(feelString, style: feelStyle),
      ),
      _detailTile(
        context,
        title: Container(
          height: 24,
          alignment: Alignment.center,
          child: Text(translations.word_min),
        ),
        value: Text(minString, style: minStyle),
      ),
      _detailTile(
        context,
        title: Container(
          height: 24,
          alignment: Alignment.center,
          child: Text(translations.word_max),
        ),
        value: Text(maxString, style: maxStyle),
      ),
      _detailTile(
        context,
        title: Container(
          height: 24,
          alignment: Alignment.center,
          child: Text(translations.word_wind),
        ),
        value: Text(windString, style: windStyle),
      ),
      _detailTile(
        context,
        title: Container(
          height: 24,
          alignment: Alignment.center,
          child: Text(translations.word_gust),
        ),
        value: Text(gustString, style: gustStyle),
      ),
      _detailTile(
        context,
        title: Container(
          height: 24,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              windIcon(weather.conditions.wind, size: 24, color: iconColor),
              const SizedBox(width: 4.0),
              Text('${windDirectionLabel(weather.conditions.wind)}  '),
            ],
          ),
        ),
        value: Text('${weather.conditions.wind.directionFrom} °', style: bold),
      ),
    ];
    final bgColor = theme.brightness == Brightness.light ? Colors.white54 : Colors.black26;
    final gridWidth = MediaQuery.of(context).size.width - 44;
    final tileWidth = gridWidth / 3;
    const desiredTileHeight = 80;
    return Container(
      height: desiredTileHeight * 2 + 10,
      color: theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.only(top: 8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(color: bgColor),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WeatherIcons.instance.thermometer(38, iconColor),
                    const Icon(Icons.air, size: 32),
                  ],
                ),
              ),
              SizedBox(
                width: gridWidth,
                child: GridView.count(
                  childAspectRatio: tileWidth / desiredTileHeight,
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  primary: false,
                  children: elements,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailTile(BuildContext context, {required Widget title, required Widget value}) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black38)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [title, const SizedBox(height: 2.0), value],
      ),
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
