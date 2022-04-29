import '../entity/common/location.dart';
import '../entity/weather/city.dart';
import '../entity/weather/current_weather.dart';
import '../entity/weather/one_call_weather.dart';
import '../service/weather_service.dart';

/// WeatherUsecase is a service use case.
///
/// It has a only business rules to difene static values for weather refresh intervals.
/// This constants are used to configure automatic refresh of weather information directly at
/// the definition of weather providers (@see [providers.dart])
class WeatherUsecase {
  const WeatherUsecase({required this.service});

  static const defaultLanguage = 'en';
  static const currentWeatherRefreshInterval = Duration(minutes: 60);
  static const oneCallWeatherRefreshInterval = Duration(hours: 4);

  final WeatherService service;

  /// Search cities matching the argument (name and country)
  Future<List<City>> searchCitiesLike(City city) => service.searchCitiesLike(city);

  /// Get the Location of a City
  Future<Location> getCityLocation(City city) => service.getCityLocation(city);

  /// Get the CurrentWeather for a location
  Future<CurrentWeather> getCurrentWeatherByLocation(Location location) {
    print('fetching current weather for $location');
    return service.getCurrentWeatherByLocation(location);
  }

  /// Get the OneCallWeather for a location
  Future<OneCallWeather> getOneCallByLocation(Location location) {
    print('fetching oneCall weather for $location');
    return service.getOneCallByLocation(location);
  }
}
