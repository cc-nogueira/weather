import 'package:_domain_layer/domain_layer.dart';

import '../model/current_weather_model.dart';

class WeatherMapper {
  const WeatherMapper();

  Weather mapEntity(CurrentWeatherModel model) {
    final weatherModel = model.weather.first;
    final main = model.main;
    return Weather(
      code: weatherModel.id,
      title: weatherModel.main,
      description: weatherModel.description,
      geo: Geo(
        latitude: model.coord.lat,
        longitude: model.coord.lon,
        dateTimeMillis: model.dt * 1000,
        timeShiftMillis: model.timezone * 1000,
        sunriseMillis: model.sys.sunrise * 1000,
        sunsetMillis: model.sys.sunset * 1000,
      ),
      humidity: main.humidity,
      temperature: Temperature(
        feelsLike: main.feelsLike,
        now: main.temp,
        min: main.tempMin,
        max: main.tempMax,
      ),
      wind: Wind(
        speed: model.wind.speed,
        gust: model.wind.gust,
        directionFrom: model.wind.deg,
      ),
    );
  }
}
