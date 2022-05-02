import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';

class GradientBox extends StatelessWidget {
  const GradientBox({Key? key, required this.city, required this.gradient}) : super(key: key);

  final City city;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) => Positioned.fill(
        child: Hero(
            tag: '${city.id}_gradientBox',
            child: DecoratedBox(decoration: BoxDecoration(gradient: gradient))),
      );
}
