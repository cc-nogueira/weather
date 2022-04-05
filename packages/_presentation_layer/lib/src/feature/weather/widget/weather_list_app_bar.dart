import 'package:flutter/material.dart';

import 'weather_order_dropdown.dart';

class WeatherListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WeatherListAppBar({Key? key, required this.onSettingsPressed})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;
  final VoidCallback onSettingsPressed;

  @override
  Widget build(BuildContext context) => AppBar(
          title: Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: const [
              Text('Weather'),
              SizedBox(width: 25),
              WeatherOrderDropdown(),
            ],
          ),
          actions: [
            //const DarkLightModeSwitch(showIconPosition: ShowIconPosition.after),
            _preferencesButton
          ]);

  Widget get _preferencesButton => Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: IconButton(
          onPressed: onSettingsPressed, icon: const Icon(Icons.settings)));
}
