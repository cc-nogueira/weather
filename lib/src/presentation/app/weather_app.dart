import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

import '../../domain/usecase/preferences_usecase.dart';
import '../common/page/message_page.dart';
import '../l10n/translations.dart';
import '../provider/presentation_providers.dart';
import '../routes/routes.dart';

/// Weather App is this application MaterialApp.
///
/// Besides the regular constructor there is WeatherApp.error constructor to
/// handle initialization errors.
class WeatherApp extends ConsumerWidget {
  /// Normal const contructor.
  const WeatherApp({super.key}) : error = null;

  /// Error state constructor.
  const WeatherApp.error(this.error, {super.key});

  /// Optional error object used by the Error constructor.
  final Object? error;

  /// Internal routes object.
  final _routes = const Routes();

  @override
  Widget build(BuildContext context, WidgetRef ref) => error == null ? _app(ref) : _errorApp;

  /// internal - build the app
  Widget _app(WidgetRef ref) {
    final locale = ref.watch(languageOptionProvider).locale;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ref.watch(themeProvider),
      onGenerateTitle: (context) => Translations.of(context)!.weather_list_page_title,
      localizationsDelegates: const [
        CountryLocalizations.delegate,
        SfGlobalLocalizations.delegate,
        ...Translations.localizationsDelegates,
      ],
      supportedLocales: Translations.supportedLocales,
      locale: locale,
      onGenerateRoute: _routes.onGenerateRoute,
      initialRoute: Routes.home,
    );
  }

  /// internal - build errorApp with no navigation configured.
  Widget get _errorApp => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        onGenerateTitle: (context) => Translations.of(context)!.weather_list_page_title,
        localizationsDelegates: Translations.localizationsDelegates,
        supportedLocales: Translations.supportedLocales,
        home: ErrorMessagePage(error!),
      );
}
