import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entity/weather/city.dart';
import '../../../common/helper/hero_flight_shuttle_builder.dart';

class WeatherTitleHero extends ConsumerWidget {
  const WeatherTitleHero({
    super.key,
    required this.city,
    required this.style,
    required this.showCountry,
    this.maxLines,
  });

  final City city;
  final bool showCountry;
  final TextStyle style;
  final int? maxLines;

  bool get _useFittedBox => maxLines == null;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Hero(
        tag: '${city.id}_weatherTitle',
        flightShuttleBuilder: heroTitleFlightShuttleBuilder,
        child: _child(context),
      );

  Widget _child(BuildContext context) {
    final widget = _text(context);
    return _useFittedBox ? FittedBox(alignment: Alignment.topLeft, child: widget) : widget;
  }

  Widget _text(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final Widget text = Text(
      city.translation(locale.languageCode),
      style: style,
      maxLines: _useFittedBox ? null : maxLines,
      overflow: _useFittedBox ? null : TextOverflow.ellipsis,
    );
    if (!showCountry) {
      return text;
    }
    final countrySize = (style.fontSize ?? 24) * 0.8;
    final countryStyle = style.copyWith(fontSize: countrySize);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [text, if (showCountry) Text(', ${city.country}', style: countryStyle)],
    );
  }
}
