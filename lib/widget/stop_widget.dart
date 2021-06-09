import 'package:flutter/material.dart';

class StopWidget extends StatefulWidget {
  const StopWidget({Key? key, required this.onClicked}) : super(key: key);

  final VoidCallback onClicked;

  @override
  _StopWidgetState createState() => _StopWidgetState();
}

class _StopWidgetState extends State<StopWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
