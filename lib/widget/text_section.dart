import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sprint/model/global_variable.dart';
import 'package:sprint/model/workout.dart';

class TextSection extends StatelessWidget {
  final String number;
  final String text;
  final String unit;

  TextSection(this.number, this.text, this.unit);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          isPressed ? number : '0',
          style: Theme.of(context).textTheme.headline2,
        ),
        Text(
          text + " (" + unit + ") ",
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }
}
