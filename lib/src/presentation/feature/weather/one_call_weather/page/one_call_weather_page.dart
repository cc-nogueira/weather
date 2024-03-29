import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../domain_layer.dart';
import '../../../../common/page/message_page.dart';
import '../../../../common/widget/loading_widget.dart';
import '../../../../provider/presentation_providers.dart';
import '../../../settings/widget/preferences_drawer.dart';
import '../widget/one_call_container_app_and_title_bar.dart';
import '../widget/one_call_weather_app_bar.dart';
import '../widget/one_call_weather_widget.dart';

class OneCallWeatherPage extends ConsumerWidget {
  const OneCallWeatherPage({super.key, required this.city, required this.currentWeather});

  final City city;
  final CurrentWeather currentWeather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkTheme = ref.watch(darkThemeProvider);
    final asyncValue = ref.watch(oneCallWeatherByLocationAutoEvictProvider(city.location!));
    return asyncValue.when(
      loading: () => _scaffold(darkTheme, false, const LoadingWidget()),
      error: ErrorMessagePage.errorBuilder,
      data: (data) => _scaffold(
        darkTheme,
        asyncValue.isRefreshing,
        OneCallWeatherWidget(city: city, oneCallWeather: data),
      ),
    );
  }

  Widget _scaffold(
    ThemeData darkTheme,
    bool isRefreshing,
    Widget body,
  ) {
    if (Platform.isWindows) {
      return _windowsScaffold(darkTheme, isRefreshing, body);
    } else {
      return _mobileScaffold(darkTheme, isRefreshing, body);
    }
  }

  Widget _mobileScaffold(ThemeData darkTheme, bool isRefreshing, Widget body) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: OneCallWeatherAppBar(
        city: city,
        initialWeather: currentWeather,
        isRefreshing: isRefreshing,
      ),
      endDrawer: const PreferencesDrawer(),
      body: Theme(
        data: darkTheme,
        child: DefaultTextStyle(
          style: TextStyle(color: darkTheme.colorScheme.onSurface),
          child: body,
        ),
      ),
    );
  }

  Widget _windowsScaffold(ThemeData darkTheme, bool isRefreshing, Widget body) {
    return Scaffold(
      backgroundColor: Colors.black,
      endDrawer: const PreferencesDrawer(),
      body: OneCallWeatherContainerAppAndTitleBar(
        city: city,
        initialWeather: currentWeather,
        isRefreshing: isRefreshing,
        child: Theme(
          data: darkTheme,
          child: DefaultTextStyle(
            style: TextStyle(color: darkTheme.colorScheme.onSurface),
            child: body,
          ),
        ),
      ),
    );
  }
}
