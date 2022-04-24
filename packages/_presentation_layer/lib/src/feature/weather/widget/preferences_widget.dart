import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'dark_light_mode_switch.dart';
import 'temperature_unit_dropdown.dart';
import 'wind_speed_unit_dropdown.dart';

class PreferencesWidget extends ConsumerWidget {
  const PreferencesWidget({
    Key? key,
    required this.showPreferencesProvider,
  }) : super(key: key);

  final StateProvider<bool> showPreferencesProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(showPreferencesProvider) ? show(context, ref.read) : Container();

  Widget show(BuildContext context, Reader read) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return GestureDetector(
      onTap: () => read(showPreferencesProvider.notifier).state = false,
      child: Container(
        decoration: BoxDecoration(color: colors.surfaceVariant.withOpacity(0.2)),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: const SettingsPanel(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPanel extends StatefulWidget {
  const SettingsPanel({Key? key}) : super(key: key);

  @override
  State<SettingsPanel> createState() => _SettingsPanelState();
}

class _SettingsPanelState extends State<SettingsPanel> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..forward();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.ease,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isDark = colors.brightness == Brightness.dark;
    final textTheme = theme.textTheme;
    final itemStyle = textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold);
    const border = BorderSide();
    return SizeTransition(
      sizeFactor: _animation,
      axis: Axis.vertical,
      axisAlignment: -1,
      child: Container(
        decoration: BoxDecoration(
          border: const Border(left: border, right: border, bottom: border),
          color: colors.surfaceVariant.withOpacity(0.95),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark/Light Theme', style: itemStyle),
                DarkLightModeSwitch(
                  showIconPosition: isDark ? ShowIconPosition.after : ShowIconPosition.before,
                  keepIconSpaces: true,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Temperature unit', style: itemStyle),
                const TemperatureUnitDropdown(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Wind speed unit', style: itemStyle),
                const WindSpeedUnitDropdown(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
