import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sprint/model/global_variable.dart';
import 'package:sprint/model/workout.dart';
import 'package:sprint/style/text_style.dart';

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
          isPressed ? number : '0.00',
          style: Style.NumberTextStyle,
        ),
        Container(
          child: Row(
            children: [
              Text(
                text,
                style: Style.DescriptionTextStyle,
              ),
              Text(
                " (" + unit + ") ",
                style: Style.DescriptionSmallTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TimeDisplay extends StatelessWidget {
  final String number;
  final String text;

  TimeDisplay(this.number, this.text,);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: Style.NumberTextStyle,
        ),
        Text(
          text,
          style: Style.DescriptionTextStyle,
        ),
      ],
    );
  }
}


class FocusDisplay extends StatelessWidget {
  final String number;
  final String text;
  final String unit;

  FocusDisplay(this.number, this.text, this.unit);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          number,
          style: Style.FocusTextStyle,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: Style.FocusDesTextStyle,
              ),
              Text(
                " (" + unit + ") ",
                style: Style.DescriptionTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
