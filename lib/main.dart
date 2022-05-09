import 'package:_di_layer/di_layer.dart';
import 'package:_presentation_layer/presentation_layer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    ProviderScope(
      child: Consumer(
        builder: (_, ref, __) => ref.watch(appProvider).when(
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (app) => app,
              error: (error, _) => WeatherApp.error(error),
            ),
      ),
    ),
  );
}

/// Provides the configured application.
///
/// Async initialzes all layers through DI Layer init method.
final appProvider = FutureProvider.autoDispose<Widget>((ref) async {
  final diLayer = ref.watch(diLayerProvider);
  await diLayer.init();
  _configureLogger();
  FlutterNativeSplash.remove();
  return const WeatherApp();
});

void _configureLogger() {
  Logger.root.level = Level.FINE; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}
