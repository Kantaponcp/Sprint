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
  String addressName = workOut.addressName ?? 'NO ADDRESS';
  String? totalMovingTime = workOut.totalMovingTime;
  String? summarySpeed = workOut.currentSpeed.toString();
  String summaryMaxSpeed = workOut.maxSpeed.toStringAsFixed(2);
  String totalDistance = workOut.totalDistance.toStringAsFixed(2);
  String totalDistanceMiles = workOut.totalDistanceMiles.toStringAsFixed(2);
  String summaryAvgSpeed = workOut.avgSpeed.toStringAsFixed(2);
  String kilometer = 'Kilometer';
  String mile = 'Mile';
  String celsius = 'Celsius';
  String fahrenheit = 'Fahrenheit';

  // listWorkOut.isEmpty? String homeTotalDistance = listWorkOut[1].totalDistance.toStringAsFixed(2);

  // String homeSpeed = listWorkOut[1].avgSpeed.toStringAsFixed(2);

  getDuration() {
    final duration = listWorkOut[1].secTime;
    var seconds = duration ~/ 1000;
    var hours = (seconds ~/ 3600).toString().padLeft(2, '0');
    var minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    if(hours == '00'){
      String? totalTime = '$minutes';
      return totalTime;
    } else {
      String? totalTime = '$hours:$minutes';
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
