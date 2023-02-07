import '../../../domain/entity/common/location.dart';
import '../../../domain/entity/weather/celcius.dart';
import '../../../domain/entity/weather/conditions.dart';
import '../../../domain/entity/weather/current_weather.dart';
import '../../../domain/entity/weather/geo.dart';
import '../../../domain/entity/weather/temperatures.dart';
import '../../../domain/entity/weather/weather.dart';
import '../../../domain/entity/weather/wind.dart';
import '../model/current_weather_model.dart';

/// CityMapper converts [CurrentWeatherModel] to [CurrentWeather] entity.
///
/// This is a one-way only conversion. Only from Model to Entity.
class CurrentWeatherMapper {
  /// Const constructor.
  const CurrentWeatherMapper();

  /// Maps a CurrentWeather service Model to a [CurrentWeather] domain Entity.
  CurrentWeather mapEntity(CurrentWeatherModel model) {
    final weatherModel = model.weather.first;
    final main = model.main;
    final conditions = Conditions(
      code: weatherModel.id,
      title: weatherModel.main,
      description: weatherModel.description,
      humidity: main.humidity,
      pressure: main.pressure,
      clouds: model.clouds.all,
      temperatures: Temperatures(
        feelsLike: Celcius(main.feelsLike),
        temperature: Celcius(main.temp),
        min: Celcius(main.tempMin),
        max: Celcius(main.tempMax),
      ),
      wind: Wind(speed: model.wind.speed, gust: model.wind.gust, directionFrom: model.wind.deg),
      rain1h: model.rain?.h1,
      snow1h: model.snow?.h1,
    );

    final weather = Weather(
      dateTimeMillis: model.dt * 1000,
      geo: Geo(
        location: Location(latitude: model.coord.lat, longitude: model.coord.lon),
        timeShiftMillis: model.timezone * 1000,
        sunriseMillis: model.sys.sunrise * 1000,
        sunsetMillis: model.sys.sunset * 1000,
      ),
      conditions: conditions,
    );

    return CurrentWeather(name: model.name, weather: weather);
  }
}
