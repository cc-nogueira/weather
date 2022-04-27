import 'dart:math';

import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qty/qty.dart';

import 'package:weather_icons/weather_icons.dart';

import 'time_widget.dart';
import 'weather_icon.dart';

class WeatherWidget extends ConsumerWidget {
  WeatherWidget({
    Key? key,
    required this.city,
    required this.onRemove,
    required this.onLoaded,
    required this.selectionProvider,
  }) : super(key: key);

  final City city;
  final VoidCallback onRemove;
  final VoidCallback onLoaded;
  final StateController<WeatherContainer?> weatherController = StateController(null);
  final StateProvider<City?> selectionProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = city.location;
    if (location == null) {
      return Container();
    }
    final isSelected = ref.watch(selectionProvider.select((selected) => selected == city));
    final temperatureUnit = ref.watch(temperatureUnitProvider);
    final windSpeedUnit = ref.watch(windSpeedUnitProvider);
    final cacheController = ref.read(weatherCacheProvider(location).notifier);
    final Weather? weatherCache = cacheController.state?.weather;

    late final FutureProvider<WeatherContainer> weatherProvider;
    if (isSelected) {
      weatherProvider = oneCallWeatherByLocationProvider(location);
      ref.invalidate(weatherContainerByLocationProvider(location));
    } else {
      weatherProvider = weatherContainerByLocationProvider(location);
    }

    final tile = ref.watch(weatherProvider).when(
          loading: () => weatherCache == null
              ? _WeatherLoadingWidget(
                  city: city,
                  isSelected: isSelected,
                  onRemove: onRemove,
                  onTap: () => onTap(ref.read, city),
                )
              : _WeatherWidget(
                  isSelected: isSelected,
                  city: city,
                  onRemove: onRemove,
                  onTap: () => onTap(ref.read, city),
                  weather: weatherCache,
                  temperatureUnit: temperatureUnit,
                  windSpeedUnit: windSpeedUnit,
                ),
          error: (_, __) => _WeatherErrorWidget(
            city: city,
            isSelected: isSelected,
            onRemove: onRemove,
            onTap: () => onTap(ref.read, city),
          ),
          data: (data) {
            weatherController.state = data;
            cacheController.state = data;
            onLoaded();
            return _WeatherWidget(
              city: city,
              isSelected: isSelected,
              weather: data.weather,
              temperatureUnit: temperatureUnit,
              windSpeedUnit: windSpeedUnit,
              onRemove: onRemove,
              onTap: () => onTap(ref.read, city),
            );
          },
        );

    return Slidable(
      key: ObjectKey(city),
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        extentRatio: 0.25,
        children: [_slideTrashAction],
        dismissible: DismissiblePane(onDismissed: onRemove),
      ),
      child: tile,
    );
  }

  SlidableAction get _slideTrashAction => SlidableAction(
        onPressed: (_) => onRemove(),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: 'Excluir',
      );

  void refresh(WidgetRef ref) {
    final location = city.location;
    if (location != null) {
      ref.read(weatherCacheProvider(location).notifier).state = null;
      ref.invalidate(currentWeatherByLocationProvider(location));
      ref.invalidate(oneCallWeatherByLocationProvider(location));
      ref.invalidate(weatherContainerByLocationProvider(location));
      ref.invalidate(timeZoneProvider(location));
    }
  }

  void onTap(Reader read, City city) =>
      read(selectionProvider.notifier).update((state) => city == state ? null : city);
}

abstract class _WeatherWidgetBase extends StatelessWidget {
  const _WeatherWidgetBase({
    Key? key,
    required this.isSelected,
    required this.city,
    required this.onRemove,
    required this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final City city;
  final VoidCallback onRemove;
  final VoidCallback onTap;

  Widget trailing(BuildContext context);
  Widget subtitle(BuildContext context);
  Widget? details(BuildContext context) => null;

  @override
  Widget build(BuildContext context) {
    final decoratedTile = weatherDecorated(context, tile(context));
    final contentDetails = isSelected ? details(context) : null;
    final content =
        contentDetails == null ? decoratedTile : Column(children: [decoratedTile, contentDetails]);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: selectionDecoratedCard(content),
      ),
    );
  }

  Widget selectionDecoratedCard(Widget child) => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: isSelected ? const BorderSide(color: Colors.red) : BorderSide.none,
        ),
        child: child,
      );

  Widget weatherDecorated(BuildContext context, Widget child) => child;

  Widget tile(BuildContext context) {
    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title(context),
        subtitle(context),
      ],
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [info, trailing(context)],
      ),
    );
  }

  Widget title(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final listTileTheme = ListTileTheme.of(context);
    final defaultColor = textTheme.subtitle1!.color;
    return Text(
      city.name,
      style: textTheme.headline5!.copyWith(
        color: textColor(theme, listTileTheme, defaultColor),
      ),
    );
  }

  Color? textColor(ThemeData theme, ListTileThemeData tileTheme, Color? defaultColor,
      [useSelected = true]) {
    if (useSelected && isSelected) {
      return tileTheme.selectedColor ??
          theme.listTileTheme.selectedColor ??
          theme.colorScheme.primary;
    }

    return tileTheme.textColor ?? theme.listTileTheme.textColor ?? defaultColor;
  }

  Color? iconColor(ThemeData theme, ListTileThemeData tileTheme) {
    final Color? color = tileTheme.iconColor ?? theme.listTileTheme.iconColor;
    if (color != null) return color;

    switch (theme.brightness) {
      case Brightness.light:
        return Colors.black45;
      case Brightness.dark:
        return null; // null - use current icon theme color
    }
  }
}

class _WeatherLoadingWidget extends _WeatherWidgetBase {
  const _WeatherLoadingWidget({
    Key? key,
    required bool isSelected,
    required City city,
    required VoidCallback onRemove,
    required VoidCallback onTap,
  }) : super(key: key, isSelected: isSelected, city: city, onRemove: onRemove, onTap: onTap);

  @override
  Widget trailing(BuildContext context) => const SizedBox(
        height: 60,
        width: 60,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: CircularProgressIndicator(color: Colors.grey),
        ),
      );

  @override
  Widget subtitle(BuildContext context) => const Text('Loading...');
}

class _WeatherErrorWidget extends _WeatherWidgetBase {
  const _WeatherErrorWidget({
    Key? key,
    required bool isSelected,
    required City city,
    required VoidCallback onRemove,
    required VoidCallback onTap,
  }) : super(key: key, isSelected: isSelected, city: city, onRemove: onRemove, onTap: onTap);

  @override
  Widget trailing(BuildContext context) => const WeatherIcon(weatherCode: -1, size: 60);

  @override
  Widget subtitle(BuildContext context) => const Text('No weather information');
}

class _WeatherWidget extends _WeatherWidgetBase {
  const _WeatherWidget({
    Key? key,
    required bool isSelected,
    required City city,
    required VoidCallback onRemove,
    required VoidCallback onTap,
    required this.weather,
    required this.temperatureUnit,
    required this.windSpeedUnit,
  }) : super(key: key, isSelected: isSelected, city: city, onRemove: onRemove, onTap: onTap);

  final Weather weather;
  final Unit<Speed> windSpeedUnit;
  final Unit<Temperature> temperatureUnit;

  @override
  Widget trailing(BuildContext context) {
    final theme = Theme.of(context);
    final ListTileThemeData tileTheme = ListTileTheme.of(context);
    final iconThemeData = IconThemeData(color: iconColor(theme, tileTheme));
    final tempSt = theme.textTheme.headline4;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${weather.conditions.temperatures.temperature.quantity.convertTo(temperatureUnit).amount.round()}',
              style: tempSt,
            ),
            TimeWidget(city.location!),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(temperatureUnit.symbol),
        ),
        IconTheme.merge(
          data: iconThemeData,
          child: weatherIcon(),
        ),
      ],
    );
  }

  Widget weatherIcon() => WeatherIcon(weatherCode: weather.conditions.code, size: 60, day: _isDay);

  @override
  Widget subtitle(BuildContext context) {
    const bold = TextStyle(fontWeight: FontWeight.bold);
    final theme = Theme.of(context);
    final tileTheme = ListTileTheme.of(context);
    final defaultColor = theme.textTheme.subtitle1!.color;
    final iconColor = textColor(theme, tileTheme, defaultColor, false);
    final convertedWindSpeed = weather.conditions.wind.speedQuantity.convertTo(windSpeedUnit);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${weather.conditions.title} (${weather.conditions.description})'),
        Row(
          children: [
            _SmallWindIcon(degree: weather.conditions.wind.directionTo, size: 20, color: iconColor),
            const SizedBox(width: 4),
            Text(_windDirectionLabel, style: bold),
            const SizedBox(width: 4),
            Text('${convertedWindSpeed.amount.round()}', style: bold),
            const SizedBox(width: 4),
            Text(convertedWindSpeed.unit.symbol),
          ],
        ),
      ],
    );
  }

  @override
  Widget weatherDecorated(BuildContext context, Widget child) => Container(
        decoration: BoxDecoration(gradient: _temperatureGradient(context)),
        child: child,
      );

  @override
  Widget? details(BuildContext context) {
    final feelTemp = weather.conditions.temperatures.feelsLike.quantity.convertTo(temperatureUnit);
    final minTemp = weather.conditions.temperatures.min?.quantity.convertTo(temperatureUnit);
    final maxTemp = weather.conditions.temperatures.max?.quantity.convertTo(temperatureUnit);
    final minString =
        minTemp == null ? '----' : '${minTemp.amount.toStringAsFixed(1)} ${temperatureUnit.symbol}';
    final maxString =
        maxTemp == null ? '----' : '${maxTemp.amount.toStringAsFixed(1)} ${temperatureUnit.symbol}';

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
        title: _windDirectionLabel + '  ',
        value: '${weather.conditions.wind.directionFrom} °',
      ),
    ];
    final gridWidth = MediaQuery.of(context).size.width - 40;
    const desiredHeight = 140;
    return Container(
      padding: const EdgeInsets.only(top: 4, bottom: 8),
      decoration: BoxDecoration(gradient: _temperatureGradient(context, true)),
      child: Row(
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
              )),
        ],
      ),
    );
  }

  String _windSpeed(Quantity<Speed>? speed) {
    if (speed == null) {
      return '---';
    }
    final converted = speed.convertTo(windSpeedUnit);
    return '${converted.amount.round()} ${converted.unit.symbol}';
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

  Gradient _temperatureGradient(
    BuildContext context, [
    bool secondPanel = false,
  ]) {
    final startColor = secondPanel
        ? Color.lerp(Theme.of(context).colorScheme.surface, _tempearatureColor, 0.1)!
        : Theme.of(context).colorScheme.surface;
    return LinearGradient(
      colors: [startColor, _tempearatureColor],
      stops: const [0.0, 1.0],
      begin: secondPanel ? Alignment.centerLeft : const Alignment(0.3, -2.8),
      end: secondPanel ? Alignment.centerRight : Alignment.bottomRight,
    );
  }

  Color get _tempearatureColor {
    final temp = weather.conditions.temperatures.temperature.value;
    if (temp < 0) {
      return Color.lerp(Colors.blue[100], Colors.blue[600]!, _rangePercent(temp, 0, -20))!;
    } else if (temp < 10) {
      return Color.lerp(Colors.blue[100]!, Colors.white, _rangePercent(temp, 0, 10))!;
    } else if (temp < 20) {
      return Color.lerp(Colors.yellow[50], Colors.yellow[300]!, _rangePercent(temp, 10, 20))!;
    } else if (temp < 30) {
      return Color.lerp(Colors.yellow[300]!, Colors.orange[900]!, _rangePercent(temp, 20, 30))!;
    } else {
      return Color.lerp(Colors.orange[900]!, Colors.red[900]!, _rangePercent(temp, 30, 40))!;
    }
  }

  double _rangePercent(double value, double start, double end) {
    if (start > end) {
      value *= -1;
      start *= -1;
      end *= -1;
    }
    if (value <= start) return 0;
    if (value >= end) return 1;
    return (value - start) / (end - start);
  }

  bool? get _isDay {
    final time = weather.localDateTime;
    final sunrise = weather.geo.localSunrise;
    final sunset = weather.geo.localSunset;
    if (_minutesBetween(time, sunrise) < 60) return null;
    if (_minutesBetween(time, sunset) < 60) return null;
    return _minutes(time) > _minutes(sunrise) && _minutes(time) < _minutes(sunset);
  }

  int _minutesBetween(DateTime a, DateTime b) {
    final sub = (_minutes(a) - _minutes(b)).abs();
    return min(sub, 24 * 60 - sub);
  }

  int _minutes(DateTime dt) => dt.hour * 60 + dt.minute;

  String get _windDirectionLabel {
    final dir = weather.conditions.wind.directionFrom;
    if (dir < 11.25) return 'N';
    if (dir < 33.75) return 'NNE';
    if (dir < 46.25) return 'NE';
    if (dir < 78.75) return 'ENE';
    if (dir < 101.25) return 'E';
    if (dir < 123.75) return 'ESE';
    if (dir < 146.25) return 'SE';
    if (dir < 168.75) return 'SSE';
    if (dir < 191.25) return 'S';
    if (dir < 213.75) return 'SSW';
    if (dir < 236.25) return 'SW';
    if (dir < 258.75) return 'WSW';
    if (dir < 281.25) return 'W';
    if (dir < 303.75) return 'WNW';
    if (dir < 326.25) return 'NW';
    if (dir < 348.75) return 'NNW';
    return 'N';
  }
}

class _SmallWindIcon extends StatelessWidget {
  const _SmallWindIcon({Key? key, required this.degree, required this.size, this.color})
      : super(key: key);

  final int degree;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) => Transform.rotate(
        angle: degree * pi / 180,
        alignment: Alignment.center,
        child: SizedBox(
          width: size,
          child: Center(
            child: RichText(
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              text: TextSpan(
                text: String.fromCharCode(WeatherIcons.wind.codePoint),
                style: TextStyle(
                  inherit: false,
                  color: color,
                  fontSize: size,
                  fontFamily: "WeatherIcons",
                  package: "weather_icons",
                ),
              ),
            ),
          ),
        ),
      );
}
