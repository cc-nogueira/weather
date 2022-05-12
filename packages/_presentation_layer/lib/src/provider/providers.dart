import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/mobile_add/ad_state.dart';
import '../layer/presentation_layer.dart';

final presentationLayerProvider =
    Provider((ref) => PresentationLayer(ref.watch(appLifecycleUsecaseProvider)));

final adStateProvider = Provider((_) => AdState());
