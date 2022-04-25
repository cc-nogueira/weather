import 'package:_domain_layer/domain_layer.dart';

import '../model/one_call_model.dart';

class OneCallMapper {
  const OneCallMapper();

  OneCall mapEntity(OneCallModel model) {
    final currentModel = model.current;
    final currentWeather = currentModel.weather.first;

    final conditions = Conditions(
      code: currentWeather.id,
      title: currentWeather.main,
      description: currentWeather.description,
      humidity: currentModel.humidity,
      pressure: currentModel.pressure,
      clouds: currentModel.clouds,
      temperatures: Temperatures(
        temperature: Celcius(currentModel.temp),
        feelsLike: Celcius(currentModel.feelsLike),
      ),
      wind: Wind(
        speed: currentModel.windSpeed,
        gust: currentModel.windGust,
        directionFrom: currentModel.windDegree,
      ),
      rain1h: currentModel.rain?.h1,
      snow1h: currentModel.snow?.h1,
    );

    final geo = Geo(
      location: Location(latitude: model.lat, longitude: model.lon),
      timeZone: model.timezone,
      timeShiftMillis: model.timezoneOffset * 1000,
      sunriseMillis: currentModel.sunrise * 1000,
      sunsetMillis: currentModel.sunset * 1000,
    );

    final weather = Weather(
      dateTimeMillis: currentModel.dt * 1000,
      geo: geo,
      conditions: conditions,
    );

    return OneCall(
      currentWeather: weather,
      hourly: _mapHourly(currentModel.hourly, geo),
      daily: _mapDaily(currentModel.daily, geo),
    );
  }

  List<HourlyWeather> _mapHourly(List<HourlyModel> hourlyModels, Geo geo) {
    final list = <HourlyWeather>[];
    for (final model in hourlyModels) {
      final weatherModel = model.weather.first;
      final hourly = HourlyWeather(
        dateTimeMillis: model.dt * 1000,
        geo: geo,
        conditions: Conditions(
          code: weatherModel.id,
          title: weatherModel.main,
          description: weatherModel.description,
          humidity: model.humidity,
          pressure: model.pressure,
          clouds: model.clouds,
          temperatures: Temperatures(
            temperature: Celcius(model.temp),
            feelsLike: Celcius(model.feelsLike),
          ),
          wind: Wind(
            speed: model.windSpeed,
            gust: model.windGust,
            directionFrom: model.windDegree,
          ),
          pop: model.pop,
          rain1h: model.rain?.h1,
          snow1h: model.snow?.h1,
        ),
      );
      list.add(hourly);
    }
    return list;
  }

  List<DailyWeather> _mapDaily(List<DailyModel> dailyModels, Geo geo) {
    final list = <DailyWeather>[];
    for (final model in dailyModels) {
      final weatherModel = model.weather.first;
      final daily = DailyWeather(
        dateTimeMillis: model.dt * 1000,
        geo: Geo(
          location: geo.location,
          timeZone: geo.timeZone,
          timeShiftMillis: geo.timeShiftMillis,
          sunriseMillis: model.sunrise * 1000,
          sunsetMillis: model.sunset * 1000,
          moonriseMillis: model.moonrise * 1000,
          moonsetMillis: model.moonset * 1000,
          moonPhase: model.moonPhase,
        ),
        conditions: DailyConditions(
          code: weatherModel.id,
          title: weatherModel.main,
          description: weatherModel.description,
          humidity: model.humidity,
          pressure: model.pressure,
          clouds: model.clouds,
          dailyTemperatures: DailyTemperatures(
            day: Celcius(model.temp.day),
            night: Celcius(model.temp.night),
            evening: Celcius(model.temp.eve),
            morning: Celcius(model.temp.morn),
          ),
          dailyFeelsLike: DailyTemperatures(
            day: Celcius(model.feelsLike.day),
            night: Celcius(model.feelsLike.night),
            evening: Celcius(model.feelsLike.eve),
            morning: Celcius(model.feelsLike.morn),
          ),
          dailyMin: Celcius(model.temp.min),
          dailyMax: Celcius(model.temp.max),
          wind: Wind(
            speed: model.windSpeed,
            gust: model.windGust,
            directionFrom: model.windDegree,
          ),
          pop: model.pop,
          rain: model.rain,
          snow: model.snow,
        ),
      );
      list.add(daily);
    }
    return list;
  }
}
