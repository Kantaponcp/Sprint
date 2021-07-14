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
          style: Style.headline1,
        ),
        Container(
          alignment: Alignment.center,
          child: Row(
            children: [
              Text(
                text,
                style: Style.bodyText1,
              ),
              Text(
                " (" + unit + ") ",
                style: Style.subTitle1,
                textAlign: TextAlign.center,
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

  TimeDisplay(
    this.number,
    this.text,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: Style.headline1,
        ),
        Text(
          text,
          style: Style.bodyText1,
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
          style: Style.title,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: Style.headline4,
              ),
              Text(
                " (" + unit + ") ",
                style: Style.bodyText1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FocusTimeDisplay extends StatelessWidget {
  final String number;
  final String text;

  FocusTimeDisplay(this.number, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          number,
          style: Style.title,
        ),
        Text(
          text,
          style: Style.headline4,
        ),
      ],
    );
  }
}
