import 'dart:io';

import 'package:_di_layer/di_layer.dart';
import 'package:_presentation_layer/presentation_layer.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  late final Widget loadingWidget;
  if (Platform.isAndroid || Platform.isIOS) {
    loadingWidget = Container();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  } else if (Platform.isWindows) {
    loadingWidget = const Center(child: CircularProgressIndicator());
    doWhenWindowReady(() {
      const min = Size(360, 700);
      const initial = Size(420, 1000);
      final win = appWindow;
      win.minSize = min;
      win.size = initial;
      win.alignment = Alignment.topRight;
      win.title = "Weather Colors";
      win.show();
    });
    // setWindowMaxSize(const Size(1024, -1));
    // setWindowMinSize(const Size(520, 700));
  }
  runApp(
    ProviderScope(
      child: Consumer(
        builder: (_, ref, __) => ref.watch(appProvider).when(
              loading: () => loadingWidget,
              data: (app) => app,
              error: (error, _) => WeatherApp.error(error),
            ),
      ),
    ),
  );
}

/// Provides the configured application.
///
/// Configure global logger.
/// Async initialzes all layers through DI Layer init method.
/// Removes splash screen just before returning the main app widget.
final appProvider = FutureProvider.autoDispose<Widget>((ref) async {
  _configureLogger();

  final diLayer = ref.watch(diLayerProvider);
  await diLayer.init();

  const app = WeatherApp();
  if (Platform.isAndroid || Platform.isIOS) {
    FlutterNativeSplash.remove();
  }
  return app;
});

void _configureLogger() {
  Logger.root.level = Level.FINE; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}
