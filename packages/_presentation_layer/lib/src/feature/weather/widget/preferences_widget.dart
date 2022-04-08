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
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isDark = colors.brightness == Brightness.dark;
    final textTheme = theme.textTheme;
    final itemStyle = textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold);
    final showPrefs = ref.watch(showPreferencesProvider);

    const border = BorderSide();
    return showPrefs
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
          )
        : Container();
  }

  void onTemperatureOptionChanged(value) {}
}
