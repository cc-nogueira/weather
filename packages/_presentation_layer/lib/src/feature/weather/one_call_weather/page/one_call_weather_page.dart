import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/page/message_page.dart';
import '../../../../common/widget/loading_widget.dart';
import '../../../settings/widget/preferences_widget.dart';
import '../widget/one_call_weather_app_bar.dart';
import '../widget/one_call_weather_widget.dart';

class OneCallWeatherPage extends ConsumerWidget {
  const OneCallWeatherPage({Key? key, required this.city, required this.weather}) : super(key: key);

  final City city;
  final Weather weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Weather weatherUpdated = weather;
    final body = ref.watch(oneCallWeatherByLocationProvider(city.location!)).when(
          loading: () => const LoadingWidget(),
          error: MessagePage.errorBuilder,
          data: (data) {
            weatherUpdated = data.weather;
            return OneCallWeatherWidget(oneCallWeather: data);
          },
        );
    return _scaffold(context, weatherUpdated, body);
  }

  Widget _scaffold(BuildContext context, Weather weatherUpdated, Widget child) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.surface,
      appBar: OneCallWeatherAppBar(city: city, weather: weatherUpdated),
      body: Stack(
        fit: StackFit.expand,
        children: [
          child,
          const PreferencesWidget(),
        ],
      ),
    );
  }
}
