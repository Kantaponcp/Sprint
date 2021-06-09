import 'package:flutter/material.dart';
import 'package:sprint/screens/home.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimeCounting extends StatefulWidget {

  @override
  _TimeCountingState createState() => _TimeCountingState();

}

class _TimeCountingState extends State<TimeCounting> {

  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;

  @override
  void dispose() {
    // TODO: implement dispose
    _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int> (
        stream: _stopWatchTimer.rawTime,
        initialData: _stopWatchTimer.rawTime.value,
        builder: (context, snapshot) {
          final value = snapshot.data;
          final displayTime = StopWatchTimer.getDisplayTime(value!, hours: _isHours);
          return Text(displayTime, style: Theme.of(context).textTheme.headline1,);
        });
  }

  void stopButton() {
    setState(() {
      _stopWatchTimer.onExecute
          .add(StopWatchExecute.stop);
    });
  }


}



