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
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(oneCallWeatherByLocationAutoEvictProvider(city.location!)).when(
            loading: () => _loadingScaffold(context),
            error: MessagePage.errorBuilder,
            data: (data) => _dataScaffold(context, data),
          );

  Widget _loadingScaffold(BuildContext context) => _scaffold(context, const LoadingWidget());

  Widget _dataScaffold(BuildContext context, OneCallWeather data) =>
      _scaffold(context, _bodyStack(data));

  Widget _scaffold(BuildContext context, Widget body) => Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: OneCallWeatherAppBar(city: city, initialWeather: weather),
        body: body,
      );

  Stack _bodyStack(OneCallWeather data) {
    return Stack(
      fit: StackFit.expand,
      children: [
        OneCallWeatherWidget(city: city, oneCallWeather: data),
        const PreferencesWidget(showChartOptions: true),
      ],
    );
  }
}
