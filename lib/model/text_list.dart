import 'package:sprint/model/workout.dart';

class TextList {
  //Main display
  String timeCountingDisplay = '00:00:00';
  String timeText = 'TIME';
  String distanceDisplay = '0.0';
  String distanceText = 'DISTANCE';
  String? currentSpeedDisplay = workOut.currentSpeed.toString();
  String currentSpeedNull = '0.0';
  String currentSpeedText = 'SPEED';
  String avgSpeedDisplay = '0.0';
  String avgSpeedText = 'AVG.SPEED';
  String duration = 'DURATION';

  //Summary display
  String topic = 'CYCLING';
  String avgSpeed = 'AVERAGE SPEED';
  String? totalWorkOutTime = workOut.totalWorkOutTime;
  String? summarySpeed = workOut.currentSpeed.toString();

  //unit
  String distanceUnit = 'km';
  String speedUnit = 'km/h';
  String timeUnit = ' ';


}
