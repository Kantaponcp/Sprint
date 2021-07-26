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






