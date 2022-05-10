import 'dart:math';

import 'package:_domain_layer/domain_layer.dart';

class OneCallWeatherStats {
  OneCallWeatherStats(OneCallWeather oneCallWeather)
      : hourlyStats = _HourlyStats(oneCallWeather),
        dailyStats = _DailyStats(oneCallWeather);

  final _HourlyStats hourlyStats;
  final _DailyStats dailyStats;

  Celcius get minTemp => Celcius(min(hourlyStats._minTemp, dailyStats._minTemp));
  Celcius get maxTemp => Celcius(max(hourlyStats._maxTemp, dailyStats._maxTemp));
  bool get hasRain => hourlyStats.hasRain || dailyStats.hasRain;
  bool get hasSnow => hourlyStats.hasSnow || dailyStats.hasSnow;
}

class _HourlyStats {
  _HourlyStats(OneCallWeather oneCallWeather)
      : hasRain = false,
        hasSnow = false {
    _calculate(oneCallWeather);
  }
  late double _minTemp;
  late double _maxTemp;

  bool hasRain;
  bool hasSnow;
  double maxRain = 0.0;
  double maxSnow = 0.0;
  Celcius get minTemp => Celcius(_minTemp);
  Celcius get maxTemp => Celcius(_maxTemp);

  void _calculate(OneCallWeather oneCallWeather) {
    final seriesData = _seriesData(oneCallWeather);
    if (seriesData.isEmpty) {
      _minTemp = 0.0;
      _maxTemp = 0.0;
    } else {
      _minTemp = seriesData.first.conditions.temperatures.temperature.value;
      _maxTemp = _minTemp;
      for (final hourly in seriesData) {
        final conditions = hourly.conditions;
        _minTemp = min(_minTemp, conditions.temperatures.temperature.value);
        _maxTemp = max(_maxTemp, conditions.temperatures.temperature.value);
        maxRain = max(maxRain, hourly.conditions.rain1h ?? 0.0);
        maxSnow = max(maxSnow, hourly.conditions.snow1h ?? 0.0);
        hasRain = hasRain || (hourly.conditions.rain1h ?? 0.0) > 0.0;
        hasSnow = hasSnow || (hourly.conditions.snow1h ?? 0.0) > 0.0;
      }
    }
  }

  List<HourlyWeather> _seriesData(OneCallWeather oneCallWeather) {
    final currentHour = _truncatedToHour(DateTime.now()).toUtc();
    final hourly = oneCallWeather.hourly;
    late int i;
    for (i = 0; i < hourly.length; ++i) {
      if (hourly[i].utcDateTime.compareTo(currentHour) >= 0) {
        break;
      }
    }
    if (i == hourly.length) return [];
    return oneCallWeather.hourly.sublist(i);
  }

  DateTime _truncatedToHour(DateTime dt) => DateTime(dt.year, dt.month, dt.day, dt.hour);
}

class _DailyStats {
  _DailyStats(OneCallWeather oneCallWeather)
      : assert(oneCallWeather.daily.isNotEmpty),
        hasRain = false,
        hasSnow = false {
    _calculate(oneCallWeather);
  }

  late double _minTemp;
  late double _maxTemp;

  bool hasRain;
  bool hasSnow;
  Celcius get minTemp => Celcius(_minTemp);
  Celcius get maxTemp => Celcius(_maxTemp);

  void _calculate(OneCallWeather oneCallWeather) {
    _minTemp = oneCallWeather.daily.first.conditions.dailyMin.value;
    _maxTemp = oneCallWeather.daily.first.conditions.dailyMax.value;
    for (final daily in oneCallWeather.daily) {
      final conditions = daily.conditions;
      _minTemp = min(_minTemp, conditions.dailyMin.value);
      _maxTemp = max(_maxTemp, conditions.dailyMax.value);
      hasRain = hasRain || (daily.conditions.rain ?? 0.0) > 0.0;
      hasSnow = hasSnow || (daily.conditions.snow ?? 0.0) > 0.0;
    }
  }
}
