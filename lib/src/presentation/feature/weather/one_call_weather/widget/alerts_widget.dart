import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/string_utils.dart';
import '../../../../../domain_layer.dart';
import '../../../../l10n/translations.dart';

class AlertsWidget extends StatelessWidget {
  const AlertsWidget({super.key, required this.weather});

  final OneCallWeather weather;

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).scaffoldBackgroundColor;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      color: bgColor,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 12.0),
        collapsedBackgroundColor: Colors.black26,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        iconColor: Colors.amber,
        collapsedIconColor: Colors.amber[300],
        leading: const Icon(Icons.warning_amber_rounded, size: 30),
        title: _title,
        subtitle: _subtitle,
        children: _details(context),
      ),
    );
  }

  Widget get _title => Text(weather.alerts.map((alert) => alert.event).join(', '));

  Widget get _subtitle {
    final senders = weather.alerts.map((alert) => alert.senderName).toSet().join(', ');
    return Text(senders);
  }

  List<Widget> _details(BuildContext context) {
    return weather.alerts.map((e) => _AlertDetails(e)).toList();
  }
}

class _AlertDetails extends StatelessWidget {
  const _AlertDetails(this.alert);

  final Alert alert;

  @override
  Widget build(BuildContext context) {
    final translations = Translations.of(context)!;
    final dtFormat = DateFormat.MEd().add_jm();
    const bold = TextStyle(fontWeight: FontWeight.w600);
    final titleStyle = bold.copyWith(color: Colors.black);
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
            margin: const EdgeInsets.only(bottom: 8.0),
            color: Colors.white70,
            child: Row(children: [Text(alert.event, style: titleStyle)]),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${translations.word_start.capitalized}:', style: bold),
                  Text('${translations.word_end.capitalized}:', style: bold),
                ],
              ),
              const SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dtFormat.format(alert.localShiftedStart)),
                  Text(dtFormat.format(alert.localShiftedEnd)),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(alert.description),
        ],
      ),
    );
  }
}
