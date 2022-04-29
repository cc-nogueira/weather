import '../entity/common/location.dart';
import '../entity/weather/city.dart';
import '../entity/weather/current_weather.dart';
import '../entity/weather/one_call_weather.dart';
import '../service/weather_service.dart';

class WeatherUsecase {
  const WeatherUsecase({required this.service});

  static const defaultLanguage = 'en';

  final WeatherService service;

  Future<List<City>> searchCitiesLike(City city) => service.searchCitiesLike(city);

  Future<Location> getCityLocation(City city) => service.getCityLocation(city);

  Future<CurrentWeather> getCurrentWeatherByLocation(Location location) {
    print('fetching current weather for $location');
    return service.getCurrentWeatherByLocation(location);
  }

  Future<OneCallWeather> getOneCallByLocation(Location location) {
    print('fetching oneCall weather for $location');
    return service.getOneCallByLocation(location);
  }
}
