import 'package:sprint/model/workout.dart';

class TextList {
  //Main display
  String timeCountingDisplay = '00:00:00';
  String timeText = 'TIME';
  String distanceDisplay = workOut.totalDistance.toStringAsFixed(2);
  String distanceText = 'DISTANCE';
  String? currentSpeedDisplay = workOut.currentSpeed.toString();
  String currentSpeedNull = '0.0';
  String currentSpeedText = 'SPEED';
  String avgSpeedDisplay = workOut.avgSpeed.toStringAsFixed(2);
  String avgSpeedText = 'AVG.SPEED';
  String duration = 'DURATION';

  //Summary display
  String topic = 'CYCLING';
  String sumAvgSpeedText = 'AVERAGE SPEED';
  String? totalWorkOutTime = workOut.totalWorkOutTime;
  String? summarySpeed = workOut.currentSpeed.toString();
  String totalDistance = workOut.totalDistance.toStringAsFixed(2);
  String summaryAvgSpeed = workOut.avgSpeed.toStringAsFixed(2);

  //unit
  String distanceUnit = 'km';
  String speedUnit = 'km/h';
  String timeUnit = ' ';


}
