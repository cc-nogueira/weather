import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/page/message_page.dart';
import '../../../../common/widget/loading_widget.dart';
import '../../../../provider/presentation_providers.dart';
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
            loading: () => _loadingScaffold(context, ref),
            error: MessagePage.errorBuilder,
            data: (data) => _dataScaffold(context, ref, data),
          );

  Widget _loadingScaffold(BuildContext context, WidgetRef ref) =>
      _scaffold(context, ref, const LoadingWidget());

  Widget _dataScaffold(BuildContext context, WidgetRef ref, OneCallWeather data) =>
      _scaffold(context, ref, _bodyStack(data));

  Widget _scaffold(BuildContext context, WidgetRef ref, Widget body) {
    final theme = ref.watch(darkThemeProvider);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: OneCallWeatherAppBar(city: city, initialWeather: weather),
      body: Theme(
          data: theme,
          child:
              DefaultTextStyle(style: TextStyle(color: theme.colorScheme.onSurface), child: body)),
    );
  }

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
