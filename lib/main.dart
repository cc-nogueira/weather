import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logging/logging.dart';

import 'src/data_layer.dart';
import 'src/domain_layer.dart';
import 'src/presentation_layer.dart';
import 'src/service_layer.dart';

final layers = [
  domainLayer,
  dataLayer,
  serviceLayer,
  presentationLayer,
];

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

  // Test devices for AddSenese
  final configuration = RequestConfiguration(testDeviceIds: ['4340F705713AEECCFF2F376E305FC836']);
  MobileAds.instance.updateRequestConfiguration(configuration);

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
/// Async initializes all layers through DI Layer init method.
/// Removes splash screen just before returning the main app widget.
final appProvider = FutureProvider.autoDispose<Widget>((ref) async {
  ref.onDispose(disposeLayers);
  _configureLogger();
  await _initLayers(ref);

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

Future<void> _initLayers(Ref ref) async {
  for (final layer in layers.reversed) {
    await layer.init(ref);
  }
  domainLayer.provisioning(dataProvision: dataLayer.provision, serviceProvision: serviceLayer.provision);
}

void disposeLayers() {
  for (final layer in layers.reversed) {
    layer.dispose();
  }
}
