import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/layer/app_layer.dart';
import '../../domain/layer/domain_layer.dart';
import '../time/service/time_api_service.dart';
import '../weather/service/open_weather_service.dart';

/// Service layer singleton.
final serviceLayer = ServiceLayer();

/// ServiceLayer has the responsibility to provide service implementaions.
///
/// This layer uses the init() call to initialize this it's object.
class ServiceLayer extends AppLayer {
  /// Implementations provisioned by the service layer
  late final ServiceLayerProvision provision;

  // TODO: Configure your OpenWeather key
  static const String openWeatherAppId = '';

  /// Initilize this layer object.
  ///
  /// Define the layer provision.
  @override
  Future<void> init(Ref ref) async {
    provision = ServiceLayerProvision(
      timeZoneServiceBuilder: () => const TimeApiService(),
      weatherServiceBuilder: () => OpenWeatherService(appId: openWeatherAppId, ref: ref),
    );
  }
}
