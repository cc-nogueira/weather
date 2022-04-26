import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/page/loading_page.dart';
import '../../../common/page/message_page.dart';
import '../../../routes/routes.dart';
import '../widget/preferences_widget.dart';
import '../widget/weather_list_app_bar.dart';
import '../widget/weather_list_widget.dart';

class WeatherListPage extends ConsumerWidget {
  const WeatherListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => ref.watch(watchAllCitiesProvider).when(
        loading: LoadingPage.builder('Weather'),
        error: MessagePage.errorBuilder,
        data: (cities) => _scaffold(context, cities),
      );

  Widget _scaffold(BuildContext context, List<City> cities) => Scaffold(
        appBar: const WeatherListAppBar(),
        body: _bodyStack(context, cities),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addCity(context),
          child: const Icon(Icons.add),
        ),
      );

  Widget _bodyStack(BuildContext context, List<City> cities) {
    return Stack(children: [
      WeatherListWidget(cities: cities),
      const PreferencesWidget(),
    ]);
  }

  void _addCity(BuildContext context) => Navigator.pushNamed(context, Routes.city);
}
