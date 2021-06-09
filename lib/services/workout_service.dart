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
    loopCalStat();
  }

  Future<void> stop(int totalWorkOutTime) async {
    workOut.stopTime = DateTime.now();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    workOut.endPoint.latitude = position.latitude;
    workOut.endPoint.longitude = position.longitude;
    workOut.totalWorkOutTime = totalWorkOutTime;
    isStopped = true;
  }

  Future<void> loopCalStat() async {
    //TODO
    //Call calStat
    if(!isStopped) {
      Future.delayed(Duration(seconds: 1), () {
        loopCalStat();
      });
    }
  }
}
