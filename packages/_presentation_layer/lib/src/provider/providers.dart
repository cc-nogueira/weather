import 'package:_domain_layer/domain_layer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../layer/presentation_layer.dart';
import 'presentation_providers.dart';

final presentationLayerProvider = Provider((ref) => PresentationLayer(
      appLifecycleUsecase: ref.watch(appLifecycleUsecaseProvider),
      adState: ref.watch(adStateProvider),
    ));
