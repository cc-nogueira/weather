import 'package:riverpod/riverpod.dart';

import '../layer/service_layer.dart';
import '../service/open_weather_service.dart';

/// Layer provider
final serviceLayerProvider = Provider((_) => ServiceLayer());

final weatherServiceProvider = Provider((_) => OpenWeatherService(
      appId: ServiceLayer.openWeatherAppId,
      language: 'en',
    ));
