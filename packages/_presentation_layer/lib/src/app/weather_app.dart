import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/page/message_page.dart';
import '../routes/routes.dart';

/// Weather App is this application MaterialApp.
///
/// Besides the regular constructor there is WeatherApp.error constructor to
/// handle initialization errors.
class WeatherApp extends ConsumerWidget {
  const WeatherApp({Key? key})
      : error = null,
        super(key: key);

  const WeatherApp.error(this.error, {Key? key}) : super(key: key);

  final title = 'Weather';
  final _routes = const Routes();
  final Object? error;

  @override
  Widget build(BuildContext context, WidgetRef ref) => error == null ? _app(ref) : _errorApp;

  Widget _app(WidgetRef ref) {
    final theme =
        ref.watch(themeModeProvider) == ThemeMode.dark ? ThemeData.dark() : ThemeData.light();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: theme,
      onGenerateRoute: _routes.onGenerateRoute,
      initialRoute: Routes.home,
    );
  }

  Widget get _errorApp => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MessagePage(title: 'Error', message: error!.toString()),
      );
}
