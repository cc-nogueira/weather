import 'package:_core_layer/core_layer.dart';

/// ServiceLayer has the responsibility to provide service implementaions.
///
/// ServiceLayer exposed implementations are also available through providers.
class ServiceLayer extends AppLayer {
  const ServiceLayer();

  // TODO: Configure your OpenWeather key
  static const String openWeatherAppId = '<your-OpenWeather-key>';
}
