import 'package:_domain_layer/domain_layer.dart';
import 'package:riverpod/riverpod.dart';

import '../layer/service_layer.dart';
import '../time/service/time_api_service.dart';
import '../weather/service/open_weather_service.dart';

/// Layer provider
final serviceLayerProvider = Provider((_) => const ServiceLayer());

/// TimeZone service implementaion provider
final timeApiServiceProvider = Provider<TimeZoneService>((_) => const TimeApiService());

/// Weather service implementation provider.
final weatherServiceProvider = Provider<WeatherService>(
    (ref) => OpenWeatherService(appId: ServiceLayer.openWeatherAppId, read: ref.read));
