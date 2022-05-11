import 'package:flutter/material.dart';

enum Scale {
  wind,
  rain,
  snow,
}

class ChartScaleDialog extends StatelessWidget {
  const ChartScaleDialog(this.scale, {Key? key}) : super(key: key);

  final Scale scale;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          decoration: BoxDecoration(color: Colors.amber[100]),
          height: 200,
          width: 400,
          child: Text(
            scale.name,
            style: const TextStyle(fontSize: 48),
          ),
        ),
      ),
    );
  }
}
