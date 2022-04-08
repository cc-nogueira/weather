import '../entity/city.dart';
import '../entity/location.dart';
import '../entity/weather.dart';
import '../service/weather_service.dart';

class WeatherUsecase {
  const WeatherUsecase({required this.service});

  static const defaultLanguage = 'en';

  final WeatherService service;

  Future<List<City>> searchCitiesLike(City city) => service.searchCitiesLike(city);

  Future<Location> getCityLocation(City city) => service.getCityLocation(city);

  Future<Weather> getCurrentWeatherByLocation(Location location) =>
      service.getCurrentWeatherByLocation(location);
}
