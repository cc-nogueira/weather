import '../entity/common/location.dart';
import '../entity/weather/city.dart';
import '../entity/weather/one_call.dart';
import '../entity/weather/weather.dart';
import '../service/weather_service.dart';

class WeatherUsecase {
  const WeatherUsecase({required this.service});

  static const defaultLanguage = 'en';

  final WeatherService service;

  Future<List<City>> searchCitiesLike(City city) => service.searchCitiesLike(city);

  Future<Location> getCityLocation(City city) => service.getCityLocation(city);

  Future<Weather> getCurrentWeatherByLocation(Location location) =>
      service.getCurrentWeatherByLocation(location);

  Future<OneCall> getOneCallByLocation(Location location) => service.getOneCallByLocation(location);
}
