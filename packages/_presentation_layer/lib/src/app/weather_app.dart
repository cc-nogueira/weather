import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/page/message_page.dart';
import '../provider/presentation_providers.dart';
import '../routes/routes.dart';

/// Weather App is this application MaterialApp.
///
/// Besides the regular constructor there is WeatherApp.error constructor to
/// handle initialization errors.
class WeatherApp extends ConsumerWidget {
  const WeatherApp({super.key}) : error = null;

  const WeatherApp.error(this.error, {super.key});

  final title = 'Weather';
  final _routes = const Routes();
  final Object? error;

  @override
  Widget build(BuildContext context, WidgetRef ref) => error == null ? _app(ref) : _errorApp;

  Widget _app(WidgetRef ref) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ref.watch(themeProvider),
        onGenerateRoute: _routes.onGenerateRoute,
        initialRoute: Routes.home,
      );

  Widget get _errorApp => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MessagePage(title: 'Error', message: error!.toString()),
      );
}
