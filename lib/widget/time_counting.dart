import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sprint/model/text_list.dart';
import 'package:sprint/model/workout.dart';

class TimeCounting extends StatefulWidget {
  const TimeCounting({Key? key}) : super(key: key);

  @override
  _TimeCountingState createState() => _TimeCountingState();
}

class _TimeCountingState extends State<TimeCounting> {
  bool isVisible = true;

  late String displayTime;
  late int secTime;

  late Stopwatch _stopwatch;
  late Timer _timer;

  void start() {
    _timer = new Timer.periodic(new Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
    _stopwatch.start();
  }

  void pause() {
    if (_timer != null) {
      _timer.cancel();
      _stopwatch.stop();
    }
  }

  void resume() {
    if (displayTime != null) {
      _timer = Timer.periodic(new Duration(milliseconds: 30), (timer) {
        setState(() {});
      });
      _stopwatch.start();
    }
  }

  String formatTime(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    displayTime = "$hours:$minutes:$seconds";
    workOut.secTime = (milliseconds ~/ 1000);
    return displayTime;
    // return "$hours:$minutes:$seconds";
  }

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    isVisible = true;
    start();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
