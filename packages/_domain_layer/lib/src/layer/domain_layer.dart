import 'package:_core_layer/core_layer.dart';
import 'package:logging/logging.dart';
import 'package:riverpod/riverpod.dart';

import '../repository/cities_repository.dart';
import '../repository/preferences_repository.dart';
import '../service/time_zone_service.dart';
import '../service/weather_service.dart';
import '../usecase/cities_usecase.dart';
import '../usecase/preferences_usecase.dart';
import '../usecase/time_zone_usecase.dart';
import '../usecase/weather_usecase.dart';

/// Function definition for Domain Layer dependencies
typedef DomainConfiguration = void Function({
  required PreferencesRepository preferencesRepository,
  required CitiesRepository citiesRepository,
  required TimeZoneService timeZoneService,
  required WeatherService weatherService,
});

/// DomainLayer has the responsibility to provide domain usecases.
///
/// To fullfill this responsibility DomainLayer requires its configuration to be
/// invoked before any usecase is accessed. Configuration is usually done during
/// DILayer's init() method.
///
/// DomainLayer configuration is also available through [domainConfigurationProvider].
///
/// Domains usecases are available through usecase providers:
///   - [citiesUsecase]
///   - [weatherUsecase]
class DomainLayer extends AppLayer {
  DomainLayer({required this.read});

  final Reader read;
  late final PreferencesUsecase preferencesUsecase;
  late final CitiesUsecase citiesUsecase;
  late final TimeZoneUsecase timeUsecase;
  late final WeatherUsecase weatherUsecase;

  void configure({
    required PreferencesRepository preferencesRepository,
    required CitiesRepository citiesRepository,
    required TimeZoneService timeZoneService,
    required WeatherService weatherService,
  }) {
    final log = Logger('usecase');
    preferencesUsecase = PreferencesUsecase(read: read, repository: preferencesRepository);
    citiesUsecase = CitiesUsecase(repository: citiesRepository);
    timeUsecase = TimeZoneUsecase(service: timeZoneService);
    weatherUsecase = WeatherUsecase(service: weatherService, log: log);
  }
}
