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
