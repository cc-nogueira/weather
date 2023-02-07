import 'dart:math';

import '../../../../../domain_layer.dart';

class OneCallWeatherStats {
  OneCallWeatherStats(OneCallWeather oneCallWeather)
      : todayStats = TodayStats(oneCallWeather),
        dailyStats = DailyStats(oneCallWeather),
        hourlyStats = HourlyStats(oneCallWeather);

  final TodayStats todayStats;
  final DailyStats dailyStats;
  final HourlyStats hourlyStats;

  Celcius get minTemp => Celcius(min(hourlyStats._minTemp, dailyStats._minTemp));
  Celcius get maxTemp => Celcius(max(hourlyStats._maxTemp, dailyStats._maxTemp));
  bool get hasRain => hourlyStats.hasRain || dailyStats.hasRain;
  bool get hasSnow => hourlyStats.hasSnow || dailyStats.hasSnow;
}

abstract class _Stats {
  _Stats(OneCallWeather oneCallWeather)
      : hasStats = false,
        hasRain = false,
        hasSnow = false {
    _calculate(oneCallWeather);
  }

  late double _minTemp;
  late double _maxTemp;

  bool hasStats;
  bool hasRain;
  bool hasSnow;
  double maxRain = 0.0;
  double maxSnow = 0.0;
  double maxWind = 0.0;
  Celcius get minTemp => Celcius(_minTemp);
  Celcius get maxTemp => Celcius(_maxTemp);

  void _calculate(OneCallWeather oneCallWeather);

  List<HourlyWeather> _hourlySeriesData(OneCallWeather oneCallWeather) {
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

class TodayStats extends _Stats {
  TodayStats(super.oneCallWeather);

  @override
  void _calculate(OneCallWeather oneCallWeather) {
    final seriesData = _hourlySeriesData(oneCallWeather);
    if (seriesData.isEmpty && oneCallWeather.daily.isEmpty) {
      _minTemp = 0.0;
      _maxTemp = 0.0;
      hasStats = false;
      return;
    }
    final today = todayDay(oneCallWeather.weather.geo);
    if (oneCallWeather.daily.isNotEmpty) {
      if (oneCallWeather.daily.first.localShiftedDateTime.day == today) {
        hasStats = true;
        final conditions = oneCallWeather.daily.first.conditions;
        _minTemp = conditions.dailyMin.value;
        _maxTemp = conditions.dailyMax.value;
        hasRain = hasRain || (conditions.rain ?? 0.0) > 0.0;
        hasSnow = hasSnow || (conditions.snow ?? 0.0) > 0.0;
      }
    }
    if (seriesData.isNotEmpty) {
      if (!hasStats && seriesData.first.localShiftedDateTime.day == today) {
        hasStats = true;
        final conditions = seriesData.first.conditions;
        _minTemp = conditions.temperatures.temperature.value;
        _maxTemp = _minTemp;
        hasRain = hasRain || (conditions.rain1h ?? 0.0) > 0.0;
        hasSnow = hasSnow || (conditions.snow1h ?? 0.0) > 0.0;
      }
      for (final hourly in seriesData) {
        if (hourly.localShiftedDateTime.day != today) {
          break;
        }
        final conditions = hourly.conditions;
        _minTemp = min(_minTemp, conditions.temperatures.temperature.value);
        _maxTemp = max(_maxTemp, conditions.temperatures.temperature.value);
        maxWind = max(maxWind, conditions.wind.speed);
        maxRain = max(maxRain, conditions.rain1h ?? 0.0);
        maxSnow = max(maxSnow, conditions.snow1h ?? 0.0);
        hasRain = hasRain || (conditions.rain1h ?? 0.0) > 0.0;
        hasSnow = hasSnow || (conditions.snow1h ?? 0.0) > 0.0;
      }
    }
  }

  int todayDay(Geo geo) {
    final now = DateTime.now().toUtc();
    final shifted = DateTime.fromMillisecondsSinceEpoch(now.millisecondsSinceEpoch + geo.timeShiftMillis, isUtc: true);
    return DateTime(shifted.year, shifted.month, shifted.day, shifted.hour, shifted.minute, shifted.second,
            shifted.millisecond, shifted.microsecond)
        .day;
  }
}

class DailyStats extends _Stats {
  DailyStats(super.oneCallWeather);

  @override
  void _calculate(OneCallWeather oneCallWeather) {
    if (oneCallWeather.daily.isEmpty) {
      _minTemp = 0.0;
      _maxTemp = 0.0;
    } else {
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
}

class HourlyStats extends _Stats {
  HourlyStats(super.oneCallWeather);

  @override
  void _calculate(OneCallWeather oneCallWeather) {
    final seriesData = _hourlySeriesData(oneCallWeather);
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
        maxWind = max(maxWind, conditions.wind.speed);
        maxRain = max(maxRain, conditions.rain1h ?? 0.0);
        maxSnow = max(maxSnow, conditions.snow1h ?? 0.0);
        hasRain = hasRain || (conditions.rain1h ?? 0.0) > 0.0;
        hasSnow = hasSnow || (conditions.snow1h ?? 0.0) > 0.0;
      }
    }
  }
}
