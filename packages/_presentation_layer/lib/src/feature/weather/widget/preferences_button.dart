import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../provider/presentation_providers.dart';

class PreferencesButton extends HookConsumerWidget {
  const PreferencesButton({Key? key}) : super(key: key);
  final duration = const Duration(seconds: 1);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(duration: duration);
    final show = ref.watch(showPreferencesProvider);
    if (show) {
      controller.forward();
    } else {
      controller.reverse();
    }
    return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: _RotatingIconButton(
          controller: controller,
          icon: const Icon(Icons.settings),
          onPressed: () => _toggleShowPreferences(ref.read),
        ));
  }

  void _toggleShowPreferences(Reader read) =>
      read(showPreferencesProvider.notifier).update((state) => !state);
}

class _RotatingIconButton extends AnimatedWidget {
  _RotatingIconButton({
    required AnimationController controller,
    required this.icon,
    required this.onPressed,
  }) : super(listenable: Tween<double>(begin: 0.0, end: 1.0).animate(controller));

  final VoidCallback onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) => RotationTransition(
        turns: listenable as Animation<double>,
        child: IconButton(onPressed: onPressed, icon: icon),
      );
}
