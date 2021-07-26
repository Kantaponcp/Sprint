import 'package:intl/intl.dart';
import 'package:sprint/model/list_workout.dart';
import 'package:sprint/model/workout.dart';
import 'package:sprint/utils/workout_preferences.dart';

import 'global_variable.dart';

class TextList {

  String version = '1.0.0';

  //Main display
  String timeCountingDisplay = '00:00:00';
  String timeText = 'TIME';
  String distanceDisplay = currentWorkout.totalDistance.toStringAsFixed(2);
  String distanceDisplayMi = currentWorkout.totalDistanceMiles.toStringAsFixed(2);
  String distanceText = 'DISTANCE';
  String? currentSpeedDisplay = currentWorkout.currentSpeed.toStringAsFixed(2);
  String? currentSpeedDisplayMi = currentWorkout.currentSpeedMiles.toStringAsFixed(2);
  String currentSpeedNull = '0';
  String currentSpeedText = 'SPEED';
  String avgSpeedDisplay = currentWorkout.avgSpeed.toStringAsFixed(2);

  // String avgSpeedDisplayMi = workOut.a.toStringAsFixed(2);
  String avgSpeedText = 'AVG.SPEED';
  String duration = 'DURATION';

  //Summary display
  String topic = 'CYCLING';
  String sumAvgSpeedText = 'AVERAGE SPEED';
  String sumMaxSpeedText = 'MAX SPEED';
  String sumMovingText = 'MOVING TIME';
  String addressName = currentWorkout.addressName;
  String totalMovingTime = currentWorkout.totalMovingTime;
  String? summarySpeed = currentWorkout.currentSpeed.toString();
  String summaryMaxSpeed = currentWorkout.maxSpeed.toStringAsFixed(2);
  String totalDistance = currentWorkout.totalDistance.toStringAsFixed(2);
  String totalDistanceMiles = currentWorkout.totalDistanceMiles.toStringAsFixed(2);
  String summaryAvgSpeed = currentWorkout.avgSpeed.toStringAsFixed(2);
  String kilometer = 'Kilometer';
  String mile = 'Mile';
  String celsius = 'Celsius';
  String fahrenheit = 'Fahrenheit';

  // listWorkOut.isEmpty? String homeTotalDistance = listWorkOut[1].totalDistance.toStringAsFixed(2);

  // String homeSpeed = listWorkOut[1].avgSpeed.toStringAsFixed(2);

  getDuration(int data) {
    final duration = data;
    var seconds = duration;
    var hours = (seconds ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((seconds ~/ 60) % 60).toString().padLeft(2, '0');
    if (duration < 60) {
      String? totalTime = '$seconds';
      return totalTime;
    } else if (duration < 3600) {
      String? totalTime = '0.$minutes';
      return totalTime;
    } else {
      String? totalTime = '$hours.$minutes';
      return totalTime;
    }
  }

  //unit
  String distanceUnitKM = 'Km';
  String distanceUnitMiles = 'Mi';
  String speedUnitKM = 'Km/Hr';
  String speedUnitMiles = 'Mi/Hr';
  String timeUnit = ' ';
  String durationUnit = 'Hr';
  String tempUnitCel = '°C';
  String tempUnitF = '°F';
}
