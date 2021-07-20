import 'package:geolocator/geolocator.dart';
import 'package:sprint/model/list_workout.dart';
import 'package:sprint/model/workout.dart';
import 'package:latlong2/latlong.dart';
import 'package:sprint/utils/workout_preferences.dart';
import '../model/global_variable.dart';
import 'package:geocoding/geocoding.dart';

class WorkOutService {

  Future<void> start() async {
    // workOut.workoutId = 'workOut01';
    workout.newObject();
    workout.startTime = DateTime.now();
    workout.date = DateTime.now();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    workout.startPoint.latitude = position.latitude;
    workout.startPoint.longitude = position.longitude;
    workout.avgSpeed = 0.0;
    isStopped = false;
    isPressed = true;
    loopCalStat();
    // listWorkout = listWorkout.copy(workoutId: 1,workout: workout);
    // WorkoutPreferences.setWorkout(listWorkout);
    print(workout.startPoint.latitude);
    print(workout.startPoint.longitude);
  }

  Future<void> stop(String totalWorkOutTime) async {
    workout.stopTime = DateTime.now();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    workout.endPoint.latitude = position.latitude;
    workout.endPoint.longitude = position.longitude;
    workout.totalMovingTime = totalWorkOutTime;
    isStopped = true;
    // listWorkout = listWorkout.copy(workout: workout);
    // WorkoutPreferences.setWorkout(listWorkout);
  }

  Future<void> pause(String totalWorkOutTime) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    isStopped = true;
    workout.stopTime = DateTime.now();
    workout.endPoint.latitude = position.latitude;
    workout.endPoint.longitude = position.longitude;
    workout.totalMovingTime = totalWorkOutTime;
    workout.currentSpeed = 0;
    //stop timecounting
  }

  double pauseDistance = 0;

  Future<void> resume(String _totalWorkOutTime) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    isStopped = false;
    workout.previousPoint.latitude = position.latitude;
    workout.previousPoint.longitude = position.longitude;
    pauseDistance = Geolocator.distanceBetween(
        workout.endPoint.latitude!,
        workout.endPoint.longitude!,
        workout.previousPoint.latitude!,
        workout.previousPoint.longitude!)/1000;
    loopCalStat();
    //resume timecounting
  }

  Future<void> loopCalStat() async {
    //TODO
    calStat();
    workout.previousPoint.latitude = workout.currentPoint.latitude;
    workout.previousPoint.longitude = workout.currentPoint.longitude;
    // workOut.secTime = secTimeForCal;
    double? avg = workout.avgSpeed;
    int? sec = workout.secTime;
    double dis = workout.totalDistance;
    double dism = workout.totalDistanceMiles;
    double s = workout.currentSpeed;
    double mis = workout.currentSpeedMiles;
    double ms = workout.maxSpeed;
    print('this is sec $sec');
    print('this is avgSpeed $avg');
    print('this is distance $dis');
    print('this is distance Miles $dism');
    print('this is pause distance $pauseDistance');
    print('this is currentSpeed $s');
    print('this is milesSpeed $mis');
    print('this is maxSpeed $ms');

    if (!isStopped) {
      Future.delayed(Duration(seconds: 1), () {
        loopCalStat();
      });
    }
  }

  Future<void> calStat() async {
    currentSpeed();
    avgSpeed();
    maxSpeed();
    totalDistance();
    getListPoint();
    getAddressName();
    // checkCurrentLocation();
  }

  Future<void> currentSpeed() async {
    Geolocator.getPositionStream(
        forceAndroidLocationManager: true,
        intervalDuration: Duration(seconds: 3),
        distanceFilter: 2,
        desiredAccuracy: LocationAccuracy.bestForNavigation)
        .listen((position) {
      workout.currentSpeed = ((position.speed *18)/5);
      workout.currentSpeedMiles = position.speed *2.2369362920544;
    });
  }

  Future<void> avgSpeed() async {
    if (workout.totalDistance == 0.0) {
      workout.avgSpeed = 0.0;
      workout.avgSpeedMi = 0.0;
    } else {
      double avgSpeedResult =
          (workout.totalDistance / workout.secTime.toDouble()) * 3600;
      workout.avgSpeed = avgSpeedResult;
    }
  }

  Future<void> maxSpeed() async{
    if(workout.currentSpeed >= workout.maxSpeed){
      workout.maxSpeed = workout.currentSpeed;
    }else{
      workout.maxSpeed = workout.maxSpeed;
    }
  }

  Future<void> totalDistance() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    workout.currentPoint.latitude = position.latitude;
    workout.currentPoint.longitude = position.longitude;
    // checkCurrentLocation();
    workout.totalDistance += Geolocator.distanceBetween(
        workout.previousPoint.latitude!,
        workout.previousPoint.longitude!,
        workout.currentPoint.latitude!,
        workout.currentPoint.longitude!) /
        1000;
    workout.totalDistance = workout.totalDistance - pauseDistance;
    // workOut.totalDistance += workOut.totalDistance;
    workout.totalDistanceMiles = (workout.totalDistance / 1.609344);
    pauseDistance = 0;
  }

  Future<void> checkCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    workout.currentPoint.latitude = position.latitude;
    workout.currentPoint.longitude = position.longitude;
  }

  Future<void> getListPoint() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    mapPoint.add(LatLng(position.latitude, position.longitude));
    print(mapPoint.length);
  }

  Future<void> getAddressName() async{
    List<Placemark> placemarks = await placemarkFromCoordinates(workout.currentPoint.latitude as double,workout.currentPoint.longitude as double);
    Placemark place = placemarks[0];
    if(place.subLocality == null) {
      workout.addressName = place.country;
    }else{
      workout.addressName = "${place.subLocality}, ${place.country}";
    }
    // workOut.addressName = place.country;
  }

}
