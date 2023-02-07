import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';

import '../../../../../domain/entity/weather/celcius.dart';
import '../../../../../domain/entity/weather/city.dart';
import '../../../../../domain/entity/weather/weather.dart';
import '../../../../../domain/provider/providers.dart';
import '../../../../../domain/usecase/preferences_usecase.dart';
import '../../../../l10n/translations.dart';
import '../../widget/color_range_mixin.dart';
import '../../widget/temperature_mixin.dart';
import '../../widget/weather_icons.dart';
import '../../widget/wind_mixin.dart';
import '../helper/one_call_weather_stats.dart';

class CurrentWeatherWidget extends ConsumerWidget {
  const CurrentWeatherWidget({
    super.key,
    required this.city,
    required this.initialWeather,
    required this.stats,
  });

  final City city;
  final Weather initialWeather;
  final OneCallWeatherStats stats;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeather = ref.watch(currentWeatherByLocationAutoRefreshProvider(city.location!));
    return currentWeather.maybeWhen(
      data: (data) => _CurrentWeatherWidget(weather: data.weather, stats: stats),
      orElse: () => _CurrentWeatherWidget(weather: initialWeather, stats: stats),
    );
  }
}

class _CurrentWeatherWidget extends ConsumerWidget with ColorRangeMixin, WindMixin, TemperatureMixin {
  const _CurrentWeatherWidget({required this.weather, required this.stats});

  final Weather weather;
  final OneCallWeatherStats stats;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final iconColor = theme.iconTheme.color ?? theme.colorScheme.onSurface;

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
                  children: _tiles(context, ref),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _tiles(BuildContext context, WidgetRef ref) {
    final tr = Translations.of(context)!;
    final theme = Theme.of(context);
    final valueStyle = theme.textTheme.headlineSmall!;
    return [
      ..._temperatureTiles(context, ref, tr, valueStyle),
      ..._windTiles(context, ref, tr, valueStyle),
    ];
  }

  List<Widget> _temperatureTiles(
    BuildContext context,
    WidgetRef ref,
    Translations tr,
    TextStyle valueStyle,
  ) {
    final temperatureUnit = ref.watch(temperatureUnitProvider);

    var minTempV = weather.conditions.temperatures.min?.value;
    var maxTempV = weather.conditions.temperatures.max?.value;
    final todayStats = stats.todayStats;
    if (todayStats.hasStats) {
      minTempV = min(minTempV ?? double.infinity, todayStats.minTemp.value);
      maxTempV = max(maxTempV ?? double.negativeInfinity, todayStats.maxTemp.value);
    }

    final feelTemp = weather.conditions.temperatures.feelsLike.quantity.convertTo(temperatureUnit);
    final minTemp = minTempV == null ? null : Celcius(minTempV).quantity.convertTo(temperatureUnit);
    final maxTemp = maxTempV == null ? null : Celcius(maxTempV).quantity.convertTo(temperatureUnit);

    final minString = minTemp == null ? '---' : '${minTemp.amount.round()} ${temperatureUnit.symbol}';
    final minStyle = minTemp == null
        ? valueStyle
        : valueStyle.copyWith(color: temperatureColor(weather.conditions.temperatures.min!));

    final maxString = maxTemp == null ? '---' : '${maxTemp.amount.round()} ${temperatureUnit.symbol}';
    final maxStyle = maxTemp == null
        ? valueStyle
        : valueStyle.copyWith(color: temperatureColor(weather.conditions.temperatures.max!));

    final feelString = '${feelTemp.amount.round()} ${temperatureUnit.symbol}';
    final feelStyle = valueStyle.copyWith(color: temperatureColor(weather.conditions.temperatures.feelsLike));

    return [
      _detailTile(title: Text(tr.word_feels_like), value: Text(feelString, style: feelStyle)),
      _detailTile(title: Text(tr.word_min), value: Text(minString, style: minStyle)),
      _detailTile(title: Text(tr.word_max), value: Text(maxString, style: maxStyle)),
    ];
  }

  List<Widget> _windTiles(
    BuildContext context,
    WidgetRef ref,
    Translations tr,
    TextStyle valueStyle,
  ) {
    final windSpeedUnit = ref.watch(windSpeedUnitProvider);

    final theme = Theme.of(context);
    final iconTheme = theme.iconTheme;
    final iconColor = iconTheme.color ?? theme.colorScheme.onSurface;

    final windString = _windSpeed(weather.conditions.wind.speedQuantity, windSpeedUnit);
    final windStyle = valueStyle.copyWith(color: windColor(weather.conditions.wind));

    final gustString = _windSpeed(weather.conditions.wind.gustQuantity, windSpeedUnit);
    final gustStyle = weather.conditions.wind.gust == null
        ? valueStyle
        : valueStyle.copyWith(color: gustColor(weather.conditions.wind));

    return [
      _detailTile(title: Text(tr.word_wind), value: Text(windString, style: windStyle)),
      _detailTile(title: Text(tr.word_gust), value: Text(gustString, style: gustStyle)),
      _detailTile(
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          windIcon(weather.conditions.wind, size: 24, color: iconColor),
          const SizedBox(width: 4.0),
          Text(windDirectionLabel(weather.conditions.wind)),
          const SizedBox(width: 24.0),
        ]),
        value: Text('${weather.conditions.wind.directionFrom} °', style: valueStyle),
      ),
    ];
  }

  Widget _detailTile({required Widget title, required Widget value}) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black38)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 24,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: FittedBox(child: title),
              )),
          const SizedBox(height: 2.0),
          value
        ],
      ),
    );
  }

  String _windSpeed(Quantity<Speed>? speed, Unit<Speed> windSpeedUnit) {
    if (speed == null) return '---';
    final converted = speed.convertTo(windSpeedUnit);
    return '${converted.amount.round()} ${converted.unit.symbol}';
  }
}
