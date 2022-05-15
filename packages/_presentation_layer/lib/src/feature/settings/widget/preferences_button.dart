import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../provider/presentation_providers.dart';

class PreferencesButton extends HookConsumerWidget {
  const PreferencesButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final duration = ref.watch(preferencesPanelAnimationDurationProvider);
    final curve = ref.watch(preferencesPanelAnimationCurve);
    final controller = useAnimationController(duration: duration);
    final animation = CurvedAnimation(parent: controller, curve: curve);

    final show = ref.watch(showPreferencesPanelProvider);
    if (show) {
      controller.forward();
    } else {
      controller.reverse();
    }
    return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: _RotatingIconButton(
          animation: animation,
          icon: const Icon(Icons.settings),
          onPressed: () => _toggleShowPreferences(ref.read),
        ));
  }

  void _toggleShowPreferences(Reader read) =>
      read(showPreferencesPanelProvider.notifier).update((state) => !state);
}

class _RotatingIconButton extends AnimatedWidget {
  const _RotatingIconButton({
    required Animation<double> animation,
    required this.icon,
    required this.onPressed,
  }) : super(listenable: animation);

  final VoidCallback onPressed;
  final Icon icon;

  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) => RotationTransition(
        turns: animation,
        child: IconButton(onPressed: onPressed, icon: icon),
      );
}
