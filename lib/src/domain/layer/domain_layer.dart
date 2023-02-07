import '../repository/cities_repository.dart';
import '../repository/preferences_repository.dart';
import '../service/time_zone_service.dart';
import '../service/weather_service.dart';
import 'app_layer.dart';

/// Domain layer singleton.
final domainLayer = DomainLayer();

/// DomainLayer is provisioned with domain runtime dependencies.
///
/// These domain interfaces implementations are provisioned (injected) in main.dart, the only scope that is above
/// all layers, that can "see" all static types and can fetch data and service provisions to inject in the domain layer.
class DomainLayer extends AppLayer {
  /// Runtime provision of Repository interfaces.
  late final DataLayerProvision dataProvision;

  /// Runtime provision of Service interfaces.
  late final ServiceLayerProvision serviceProvision;

  /// Runtime provisioning of interface implementations.
  ///
  /// This method must be called only once, usually from main.dart.
  void provisioning({required DataLayerProvision dataProvision, required ServiceLayerProvision serviceProvision}) {
    this.dataProvision = dataProvision;
    this.serviceProvision = serviceProvision;
  }
}

/// Data Layer provisions.
///
/// Define the domain interfaces that need to be provided by the data layer.
class DataLayerProvision {
  const DataLayerProvision({required this.preferencesRepositoryBuilder, required this.citiesRepositoryBuilder});

  final ProvisionBuilder<PreferencesRepository> preferencesRepositoryBuilder;
  final ProvisionBuilder<CitiesRepository> citiesRepositoryBuilder;
}

/// Service Layer provisions.
///
/// Define the domain interfaces that need to be provided by the service layer.
class ServiceLayerProvision {
  const ServiceLayerProvision({required this.timeZoneServiceBuilder, required this.weatherServiceBuilder});

  final ProvisionBuilder<TimeZoneService> timeZoneServiceBuilder;
  final ProvisionBuilder<WeatherService> weatherServiceBuilder;
}
