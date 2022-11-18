import 'package:_core_layer/core_layer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../provider/providers.dart';
import '../repository/cities_repository.dart';
import '../repository/preferences_repository.dart';
import '../service/time_zone_service.dart';
import '../service/weather_service.dart';
import '../usecase/cities_usecase.dart';
import '../usecase/preferences_usecase.dart';
import '../usecase/time_zone_usecase.dart';
import '../usecase/weather_usecase.dart';

part 'domain_layer.g.dart';

/// Domain Layer provider
@Riverpod(keepAlive: true)
DomainLayer domainLayer(DomainLayerRef ref) => DomainLayer(ref: ref);

/// Function provider for dependency configuration (implementation injection)
@riverpod
DomainConfiguration domainConfiguration(DomainConfigurationRef ref) =>
    ref.watch(domainLayerProvider).configure;

/// PreferencesUsecase singleton provider
@Riverpod(keepAlive: true)
PreferencesUsecase preferencesUsecase(PreferencesUsecaseRef ref) =>
    ref.watch(domainLayerProvider).preferencesUsecase;

/// CitiesUsecase singleton provider
@Riverpod(keepAlive: true)
CitiesUsecase citiesUsecase(CitiesUsecaseRef ref) => ref.watch(domainLayerProvider).citiesUsecase;

/// TimeZoneUsecase singleton provider
@Riverpod(keepAlive: true)
TimeZoneUsecase timeZoneUsecase(TimeZoneUsecaseRef ref) =>
    ref.watch(domainLayerProvider).timeUsecase;

/// WeatherUsecase singleton provider
@Riverpod(keepAlive: true)
WeatherUsecase weatherUsecase(WeatherUsecaseRef ref) =>
    ref.watch(domainLayerProvider).weatherUsecase;

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
/// On initialization this layer registers itself as a WidgetsBindings observer listenning to
/// changes in system locales, maintainging the corresponding system locales provider up to date.
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
class DomainLayer extends AppLayer with WidgetsBindingObserver {
  /// Constructor.
  ///
  /// Required a Riverpod Reader to instantite the [PreferencesUsecase].
  DomainLayer({required this.ref});

  /// Internal reader
  @internal
  final Ref ref;

  /// Configured [PreferencesUsecase] singleton.
  late final PreferencesUsecase preferencesUsecase;

  /// Configured [CitiesUsecase] singleton.
  late final CitiesUsecase citiesUsecase;

  /// Configured [TimeZoneUsecase] singleton.
  late final TimeZoneUsecase timeUsecase;

  /// Configured [WeatherUsecase] singleton.
  late final WeatherUsecase weatherUsecase;

  /// Initialize the DomainLayer.
  ///
  /// Intializes the systemLocalesProvider state and register this layer object as a
  /// WidgetsBindings observer to keep this provider always up to date with system locale changes.
  @override
  Future<void> init() {
    final systemLocales = WidgetsBinding.instance.platformDispatcher.locales;
    ref.read(systemLocalesProvider.notifier).state = systemLocales;

    WidgetsBinding.instance.addObserver(this);

    return SynchronousFuture(null);
  }

  /// Handle system locales changes.
  ///
  /// Keep the systemLocalesProvier up to date with the system locales.
  @override
  void didChangeLocales(List<Locale>? locales) {
    if (locales != null) {
      ref.read(systemLocalesProvider.notifier).state = locales;
    }
  }

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
    preferencesUsecase = PreferencesUsecase(ref: ref, repository: preferencesRepository);
    citiesUsecase = CitiesUsecase(repository: citiesRepository);
    timeUsecase = TimeZoneUsecase(service: timeZoneService);
    weatherUsecase = WeatherUsecase(service: weatherService, log: log);
  }
}
