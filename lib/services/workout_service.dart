import 'package:geolocator/geolocator.dart';
import 'package:sprint/model/workout.dart';

import '../model/global_variable.dart';

class WorkOutService {

  Future<void> start() async {
    workOut.workoutId = 'workOut01';
    workOut.newObject();
    workOut.startTime = DateTime.now();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    workOut.startPoint.latitude = position.latitude;
    workOut.startPoint.longitude = position.longitude;
    workOut.currentSpeed = 0;
    workOut.avgSpeed = 0;
    isStopped = false;
    isPressed = true;
    loopCalStat();
  }

  Future<void> stop(String totalWorkOutTime) async {
    workOut.stopTime = DateTime.now();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    workOut.endPoint.latitude = position.latitude;
    workOut.endPoint.longitude = position.longitude;
    workOut.totalWorkOutTime = totalWorkOutTime;
    isStopped = true;
  }

  Future<void> pause(String totalWorkOutTime) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    isStopped = true;
    workOut.stopTime = DateTime.now();
    workOut.endPoint.latitude = position.latitude;
    workOut.endPoint.longitude = position.longitude;
    workOut.totalWorkOutTime = totalWorkOutTime;
    workOut.currentSpeed = 0;
    //stop timecounting
  }

  Future<void> resume(String _totalWorkOutTime) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    isStopped = false;
    workOut.currentPoint.latitude = position.latitude;
    workOut.currentPoint.longitude = position.longitude;
    loopCalStat();
    //resume timecounting
  }

  Future<void> loopCalStat() async {
    //TODO
    calStat();
    workOut.previousPoint.latitude = workOut.currentPoint.latitude;
    workOut.previousPoint.longitude = workOut.currentPoint.longitude;
    // workOut.secTime = secTimeForCal;
    double? avg = workOut.avgSpeed;
    int? sec = workOut.secTime;
    double dis = workOut.totalDistance;
    print('this is sec $sec');
    print('this is avgSpeed $avg');
    print('this is distance $dis');
    if (!isStopped) {
      Future.delayed(Duration(seconds: 1), () {
        loopCalStat();
      });
    }
  }

  Future<void> calStat() async {
    currentSpeed();
    avgSpeed();
    totalDistance();
    // loopSecTime(wo);
  }

  Future<void> currentSpeed() async {
      Geolocator.getPositionStream(
          forceAndroidLocationManager: true,
          intervalDuration: Duration(seconds: 3),
          distanceFilter: 2,
          desiredAccuracy: LocationAccuracy.bestForNavigation)
          .listen((position) {
        workOut.currentSpeed = position.speed;
      });
  }

  Future<void> avgSpeed() async {

   double avgSpeedResult = (workOut.totalDistance/workOut.secTime.toDouble()) * 3600;
   workOut.avgSpeed = avgSpeedResult;
  }

  Future<void> totalDistance() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    workOut.currentPoint.latitude = position.latitude;
    workOut.currentPoint.longitude = position.longitude;
    workOut.totalDistance = Geolocator.distanceBetween(
            workOut.startPoint.latitude!,
            workOut.startPoint.longitude!,
            workOut.currentPoint.latitude!,
            workOut.currentPoint.longitude!) /
        1000;
    // workOut.totalDistance += workOut.totalDistance;
  }

  Future <void> convertToMile() async {
    workOut.totalDistanceMiles = (workOut.totalDistance / 1.609344);
  }

}
