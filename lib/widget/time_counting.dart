import 'dart:async';
import 'package:sprint/model/workout.dart';

bool isVisible = true;

late String displayTime;
late int secTime;

Stopwatch stopwatch = Stopwatch();
Timer? timer;

void pause() {
  if (timer != null) {
    timer!.cancel();
    stopwatch.stop();
  }
}

String formatTime(int milliseconds) {
  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');
  displayTime = "$hours:$minutes:$seconds";
  workout.secTime = (milliseconds ~/ 1000);
  return displayTime;
  // return "$hours:$minutes:$seconds";
}



