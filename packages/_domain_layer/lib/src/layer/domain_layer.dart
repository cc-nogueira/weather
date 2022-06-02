import 'package:_core_layer/core_layer.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:riverpod/riverpod.dart';

import '../repository/cities_repository.dart';
import '../repository/preferences_repository.dart';
import '../service/time_zone_service.dart';
import '../service/weather_service.dart';
import '../usecase/cities_usecase.dart';
import '../usecase/preferences_usecase.dart';
import '../usecase/time_zone_usecase.dart';
import '../usecase/weather_usecase.dart';

/// Function definition for Domain Layer dependencies.
///
/// Defines the required implementations of known interfaces.
/// This signature is used by the [configure] method bellow to inject dependencies.
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
///   - [preferencesUsecase]
///   - [citiesUsecase]
///   - [timeUsecase]
///   - [weatherUsecase]
class DomainLayer extends AppLayer {
  /// Constructor.
  ///
  /// Required a Riverpod Reader to instantite the [PreferencesUsecase].
  DomainLayer({required this.read});

  /// Internal reader
  @internal
  final Reader read;

  /// Configured [PreferencesUsecase] singleton.
  late final PreferencesUsecase preferencesUsecase;

  /// Configured [CitiesUsecase] singleton.
  late final CitiesUsecase citiesUsecase;

  /// Configured [TimeZoneUsecase] singleton.
  late final TimeZoneUsecase timeUsecase;

  /// Configured [WeatherUsecase] singleton.
  late final WeatherUsecase weatherUsecase;

  /// Configure method called by the [DiLayer] object at system initialization.
  ///
  /// This invocation injects the required implementations for this Layer.
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
