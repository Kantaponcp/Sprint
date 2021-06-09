import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final String _number;
  final String _text;
  final String _unit;

  TextSection(this._number, this._text, this._unit);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_number, style: Theme.of(context).textTheme.headline2,),
        Text(_text + " (" + _unit + ") ", style: Theme.of(context).textTheme.subtitle1,),
      ],
    );
  }
}

class TextList {
  //Main display
  String timeCountingDisplay = '00:00:00';
  String timeText = 'TIME';
  String distanceDisplay = '0.0';
  String distanceText = 'DISTANCE';
  String currentSpeedDisplay = '0.0';
  String currentSpeedText = 'SPEED';
  String avgSpeedDisplay = '0.0';
  String avgSpeedText = 'AVG.SPEED';
  String duration = 'DURATION';

  //unit
  String distanceUnit = 'km';
  String speedUnit = 'km/h';

}
