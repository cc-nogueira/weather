import 'dart:io';

import 'package:_di_layer/di_layer.dart';
import 'package:_presentation_layer/presentation_layer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:window_size/window_size.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMaxSize(const Size(640, -1));
    setWindowMinSize(const Size(540, 700));
  } else {
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }
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
  _configureLogger();

  final diLayer = ref.watch(diLayerProvider);
  await diLayer.init();

  final adState = ref.watch(adStateProvider);
  await adState.init();

  if (Platform.isAndroid || Platform.isIOS) {
    FlutterNativeSplash.remove();
  }

  return const WeatherApp();
});

void _configureLogger() {
  Logger.root.level = Level.FINE; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {});
}
