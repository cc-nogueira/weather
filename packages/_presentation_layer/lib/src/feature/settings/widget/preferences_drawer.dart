import 'package:flutter/material.dart';

import '../../../l10n/translations.dart';
import 'dark_light_mode_switch.dart';
import 'language_dropdown.dart';
import 'order_dropdown.dart';
import 'precipitation_unit_dropdown.dart';
import 'temperature_unit_dropdown.dart';
import 'wind_speed_unit_dropdown.dart';

class PreferencesDrawer extends StatelessWidget {
  const PreferencesDrawer({Key? key}) : super(key: key);

  static const _padding = EdgeInsets.symmetric(horizontal: 12.0);

  @override
  Widget build(BuildContext context) {
    final translations = Translations.of(context)!;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final side = BorderSide(width: 1.5, color: colors.onSurface);
    return Drawer(
      width: 340,
      child: DecoratedBox(
        decoration: BoxDecoration(border: Border(left: side)),
        child: Column(
          children: [
            _header(context, translations),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _themePreferences(translations),
                  _divider,
                  _languagePreferences(translations),
                  _divider,
                  _sortPreferences(translations),
                  _divider,
                  _unitPreferences(translations),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _divider => const Padding(padding: _padding, child: Divider());

  Widget _header(BuildContext context, Translations translations) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colors = theme.colorScheme;
    final side = BorderSide(width: 1.5, color: colors.onSurface);
    return DrawerHeader(
      padding: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(color: colors.surface),
      child: Container(
        decoration: BoxDecoration(color: theme.colorScheme.surface, border: Border(left: side)),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(translations.title_preferences, style: textTheme.headlineSmall),
                const CloseButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _themePreferences(Translations translations) {
    return _tableWith([
      TableRow(children: [
        Text(translations.dark_light_theme_label),
        DarkLightModeSwitch(changeCallback: _onChangePreference),
      ]),
    ]);
  }

  Widget _languagePreferences(Translations translations) {
    return _tableWith([
      TableRow(children: [
        Text(translations.label_language_selector),
        LanguageDropdown(changeCallback: _onChangePreference),
      ]),
    ]);
  }

  Widget _sortPreferences(Translations translations) {
    return _tableWith([
      TableRow(children: [
        Text(translations.label_list_order),
        const OrderDropdown(),
      ]),
    ]);
  }

  Widget _unitPreferences(Translations translations) {
    return _tableWith([
      TableRow(children: [
        Text(translations.temp_unit_label),
        TemperatureUnitDropdown(changeCallback: _onChangePreference),
      ]),
      TableRow(children: [
        Text(translations.wind_speed_unit_label),
        WindSpeedUnitDropdown(changeCallback: _onChangePreference),
      ]),
      TableRow(children: [
        Text(translations.precipitation_unit_label),
        PrecipitationUnitDropdown(changeCallback: _onChangePreference),
      ]),
    ]);
  }

  Widget _tableWith(List<TableRow> rows) => Padding(
        padding: _padding,
        child: Table(
          columnWidths: const {0: FlexColumnWidth(), 1: IntrinsicColumnWidth()},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: rows,
        ),
      );

  void _onChangePreference() {
    // onDismiss();
  }
}
