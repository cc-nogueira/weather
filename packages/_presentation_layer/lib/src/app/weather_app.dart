import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/page/message_page.dart';
import '../l10n/translations.dart';
import '../provider/presentation_providers.dart';
import '../routes/routes.dart';

/// Weather App is this application MaterialApp.
///
/// Besides the regular constructor there is WeatherApp.error constructor to
/// handle initialization errors.
class WeatherApp extends ConsumerWidget {
  const WeatherApp({super.key}) : error = null;

  const WeatherApp.error(this.error, {super.key});

  final _routes = const Routes();
  final Object? error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return error == null ? _app(ref) : _errorApp;
  }

  Widget _app(WidgetRef ref) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ref.watch(themeProvider),
        onGenerateTitle: (context) => Translations.of(context)!.weather_list_page_title,
        localizationsDelegates: Translations.localizationsDelegates,
        supportedLocales: Translations.supportedLocales,
        onGenerateRoute: _routes.onGenerateRoute,
        initialRoute: Routes.home,
      );

  Widget get _errorApp => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        onGenerateTitle: (context) => Translations.of(context)!.weather_list_page_title,
        localizationsDelegates: const [
          Translations.delegate,
          ...GlobalMaterialLocalizations.delegates,
        ],
        supportedLocales: Translations.supportedLocales,
        home: ErrorMessagePage(error!),
      );
}
