import '../entity/weather/city.dart';
import '../exception/validation_exception.dart';
import '../repository/cities_repository.dart';
import 'entity_stream_usecase.dart';

class CitiesUsecase extends EntityStreamUsecase<City> {
  const CitiesUsecase({required CitiesRepository repository}) : super(repository: repository);

  /// Compare two cities by user defined order.
  @override
  int compare(City a, City b) => a.order.compareTo(b.order);

  /// Validate city's content.
  ///
  /// Throws a validation exception if city's name is empty or city's country is
  /// not a two letter string.
  @override
  void validate(City city) {
    if (city.name.trim().isEmpty) {
      throw const ValidationException('City\'s name is required');
    }
    if (city.country.trim().length != 2) {
      throw const ValidationException('City\'s country should be two letters');
    }
    if (city.location == null) {
      throw const ValidationException('City\'s location coordinates are required');
    }
  }

  /// Adjust city's contents.
  ///
  /// Trim contacts name, state and country if necessary.
  /// Sets country to uppercase.
  @override
  City adjust(City city) {
    var adjusted = city;
    final adjustedName = city.name.trim();
    if (adjustedName != city.name) {
      adjusted = adjusted.copyWith(name: adjustedName);
    }
    final adjustedState = city.state.trim();
    if (adjustedState != city.state) {
      adjusted = adjusted.copyWith(state: adjustedState);
    }
    final adjustedCountry = city.country.trim().toUpperCase();
    if (adjustedCountry != city.country) {
      adjusted = adjusted.copyWith(country: adjustedCountry);
    }
    if (city.order == -1) {
      adjusted = adjusted.copyWith(order: count());
    }
    return adjusted;
  }
}
