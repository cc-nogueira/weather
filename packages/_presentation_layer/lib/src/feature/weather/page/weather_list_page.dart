import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/page/loading_page.dart';
import '../../../common/page/message_page.dart';
import '../../../routes/routes.dart';
import '../widget/preferences_widget.dart';
import '../widget/weather_list_app_bar.dart';
import '../widget/weather_list_widget.dart';

final _showPreferencesProvider = StateProvider((_) => false);

class WeatherListPage extends ConsumerWidget {
  const WeatherListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(watchAllCitiesProvider).when(
            loading: LoadingPage.builder('Weather'),
            error: MessagePage.errorBuilder,
            data: (cities) => _scaffold(context, ref, cities),
          );

  Widget _scaffold(BuildContext context, WidgetRef ref, List<City> cities) =>
      Scaffold(
        appBar: WeatherListAppBar(
          onSettingsPressed: () => _toggleShowPreferences(ref.read),
        ),
        body: _bodyStack(context, cities),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addCity(context),
          child: const Icon(Icons.add),
        ),
      );

  Widget _bodyStack(BuildContext context, List<City> cities) {
    return Stack(children: [
      WeatherListWidget(cities: cities),
      PreferencesWidget(showPreferencesProvider: _showPreferencesProvider),
    ]);
  }

  void _toggleShowPreferences(Reader read) =>
      read(_showPreferencesProvider.notifier).update((state) => !state);

  /*
  void _showPreferences(BuildContext context) async {
    await showGeneralDialog(
        context: context,
        pageBuilder: (BuildContext buildContext, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return SafeArea(
            child: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [Center(child: Text('Testing'))],
                      ),
                    ),
                  ],
                )),
          );
        },
        barrierDismissible: true,
        barrierLabel:
            'close', // MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: const Color(0x61000000),
        transitionDuration: const Duration(milliseconds: 800));
  }
  */

  void _addCity(BuildContext context) =>
      Navigator.pushNamed(context, Routes.city);
}
