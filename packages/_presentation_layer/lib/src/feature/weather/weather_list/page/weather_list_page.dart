import 'dart:io';

import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/page/loading_page.dart';
import '../../../../common/page/message_page.dart';
import '../../../../common/widget/window_with_title_bar.dart';
import '../../../../l10n/translations.dart';
import '../../../../routes/routes.dart';
import '../../../settings/widget/preferences_app_bar.dart';
import '../../../settings/widget/preferences_drawer.dart';
import '../widget/weather_list.dart';

class WeatherListPage extends ConsumerWidget {
  const WeatherListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = Translations.of(context)!;
    return ref.watch(watchAllCitiesProvider).when(
          loading: LoadingPage.builder(translations.weather_list_page_title),
          error: ErrorMessagePage.errorBuilder,
          data: (cities) => _scaffold(context, ref.read, translations, cities),
        );
  }

  Widget _scaffold(
    BuildContext context,
    Reader read,
    Translations translations,
    List<City> cities,
  ) {
    if (Platform.isWindows) {
      return _windowsScaffold(context, read, translations, cities);
    } else {
      return _mobileScaffold(context, read, translations, cities);
    }
  }

  Widget _mobileScaffold(
    BuildContext context,
    Reader read,
    Translations translations,
    List<City> cities,
  ) =>
      Scaffold(
        appBar: PreferencesAppBar(title: translations.weather_list_page_title),
        endDrawer: const PreferencesDrawer(),
        body: WeatherList(read: read, cities: cities),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addCity(context),
          child: const Icon(Icons.add),
        ),
      );

  Widget _windowsScaffold(
    BuildContext context,
    Reader read,
    Translations translations,
    List<City> cities,
  ) =>
      Scaffold(
        endDrawer: const PreferencesDrawer(),
        body: WindowWithTitleBar(
          appBar: PreferencesAppBar(title: translations.weather_list_page_title),
          child: WeatherList(read: read, cities: cities),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addCity(context),
          child: const Icon(Icons.add),
        ),
      );

  void _addCity(BuildContext context) => Navigator.pushNamed(context, Routes.city);
}
