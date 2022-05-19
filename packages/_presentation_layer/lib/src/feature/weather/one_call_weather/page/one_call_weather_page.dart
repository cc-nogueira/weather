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
  const OneCallWeatherPage({super.key, required this.city, required this.weather});

  final City city;
  final Weather weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(oneCallWeatherByLocationAutoEvictProvider(city.location!));
    return asyncValue.when(
      loading: () => _loadingScaffold(context, ref),
      error: MessagePage.errorBuilder,
      data: (data) => _dataScaffold(context, ref, asyncValue.isRefreshing, data),
    );
  }

  Widget _loadingScaffold(BuildContext context, WidgetRef ref) =>
      _scaffold(context, ref, false, const LoadingWidget());

  Widget _dataScaffold(
          BuildContext context, WidgetRef ref, bool isRefreshing, OneCallWeather data) =>
      _scaffold(context, ref, isRefreshing, _bodyStack(data));

  Widget _scaffold(BuildContext context, WidgetRef ref, bool isRefreshing, Widget body) {
    final theme = ref.watch(darkThemeProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: OneCallWeatherAppBar(city: city, initialWeather: weather, isRefreshing: isRefreshing),
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
        const PreferencesWidget(),
      ],
    );
  }
}
