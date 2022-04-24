import 'package:riverpod/riverpod.dart';

import '../layer/service_layer.dart';
import '../time/service/time_api_service.dart';
import '../weather/service/open_weather_service.dart';

/// Layer provider
final serviceLayerProvider = Provider((_) => ServiceLayer());

final timeApiServiceProvider = Provider((_) => const TimeApiService());

final weatherServiceProvider = Provider((_) => OpenWeatherService(
      appId: ServiceLayer.openWeatherAppId,
      language: 'en',
    ));
