import 'package:riverpod/riverpod.dart';

import '../layer/service_layer.dart';
import '../time/service/time_api_service.dart';
import '../weather/service/open_weather_service.dart';

/// Layer provider
final serviceLayerProvider = Provider((_) => const ServiceLayer());

final timeApiServiceProvider = Provider((_) => const TimeApiService());

final weatherServiceProvider =
    Provider((ref) => OpenWeatherService(appId: ServiceLayer.openWeatherAppId, read: ref.read));
