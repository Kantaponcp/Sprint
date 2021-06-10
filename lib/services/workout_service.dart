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

  // Future<void> pause(String totalWorkOutTime) async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   isStopped = true;
  //   workOut.stopTime = DateTime.now();
  //   workOut.endPoint.latitude = position.latitude;
  //   workOut.endPoint.longitude = position.longitude;
  //   workOut.totalWorkOutTime = totalWorkOutTime;
  //   //stop timecounting
  // }
  //
  // Future<void> resume(int _totalWorkOutTime) async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   isStopped = false;
  //   loopCalStat();
  //   //resume timecounting
  // }
  //
  Future<void> loopCalStat() async {
    //TODO
    currentSpeed();
    if(!isStopped) {
      Future.delayed(Duration(seconds: 1), () {
        loopCalStat();
      });
    }
  }

  Future<void> calStat() async{
    currentSpeed();
    // avgSpeed();
    // totalDistance();
  }


  Future<void> currentSpeed() async{
    Geolocator.getPositionStream(
        forceAndroidLocationManager: true,
        intervalDuration: Duration(seconds: 3),
        distanceFilter: 2,
        desiredAccuracy: LocationAccuracy.bestForNavigation
    ).listen((position) {
      workOut.currentSpeed = position.speed.toInt();
    });
  }
  //
  // Future<void> avgSpeed() async{
  //   // workOut.avgSpeed = (workOut.totalDistance! / workOut.totalWorkOutTime.);
  //
  // }
  //
  // Future<void> totalDistance() async{
  //   workOut.totalDistance = Geolocator.distanceBetween(workOut.startPoint.latitude!,workOut.startPoint.longitude!,workOut.endPoint.latitude!,workOut.endPoint.longitude!);
  // }
}
