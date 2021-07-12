import 'package:sprint/model/workout.dart';

class TextList {
  String version = '1.0.0';
  //Main display
  String timeCountingDisplay = '00:00:00';
  String timeText = 'TIME';
  String distanceDisplay = workOut.totalDistance.toStringAsFixed(2);
  String distanceText = 'DISTANCE';
  String? currentSpeedDisplay = workOut.currentSpeed.toStringAsFixed(2);
  String currentSpeedNull = '0';
  String currentSpeedText = 'SPEED';
  String avgSpeedDisplay = workOut.avgSpeed.toStringAsFixed(2);
  // String avgSpeedDisplay = workOut.avgSpeed.toString();
  String avgSpeedText = 'AVG.SPEED';
  String duration = 'DURATION';

  //Summary display
  String topic = 'CYCLING';
  String sumAvgSpeedText = 'AVERAGE SPEED';
  String sumMaxSpeedText = 'MAX SPEED';
  String sumMovingText = 'MOVING TIME';
  String? totalMovingTime = workOut.totalMovingTime;
  String? summarySpeed = workOut.currentSpeed.toString();
  String totalDistance = workOut.totalDistance.toStringAsFixed(2);
  String totalDistanceMiles = workOut.totalDistanceMiles.toStringAsFixed(2);
  String summaryAvgSpeed = workOut.avgSpeed.toStringAsFixed(2);
  // String summaryAvgSpeed = workOut.avgSpeed.toString();
  String kilometer = 'Kilometer';
  String mile = 'Mile';
  String celsius = 'Celsius';
  String fahrenheit = 'Fahrenheit';

  //unit
  String distanceUnit = 'Km';
  String distanceUnitMiles = 'Mi';
  String speedUnit = 'Km/Hr';
  String timeUnit = ' ';
  String durationUnit = 'Hr';
  String tempUnitCel = '°C';
  String tempUnitF = '°F';


}
