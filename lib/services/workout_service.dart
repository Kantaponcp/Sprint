import 'package:geolocator/geolocator.dart';
import 'package:sprint/model/workout.dart';
import 'package:latlong2/latlong.dart';
import '../model/global_variable.dart';
import 'package:geocoding/geocoding.dart';

class WorkOutService {
  Future<void> start() async {
    // workOut.workoutId = 'workOut01';
    workOut.newObject();
    workOut.startTime = DateTime.now();
    workOut.date = DateTime.now();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    workOut.startPoint.latitude = position.latitude;
    workOut.startPoint.longitude = position.longitude;
    workOut.avgSpeed = 0.0;
    isStopped = false;
    isPressed = true;
    loopCalStat();
    print(workOut.startPoint.latitude);
    print(workOut.startPoint.longitude);
  }

  Future<void> stop(String totalWorkOutTime) async {
    workOut.stopTime = DateTime.now();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    workOut.endPoint.latitude = position.latitude;
    workOut.endPoint.longitude = position.longitude;
    workOut.totalMovingTime = totalWorkOutTime;
    isStopped = true;
  }

  Future<void> pause(String totalWorkOutTime) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    isStopped = true;
    workOut.stopTime = DateTime.now();
    workOut.endPoint.latitude = position.latitude;
    workOut.endPoint.longitude = position.longitude;
    workOut.totalMovingTime = totalWorkOutTime;
    workOut.currentSpeed = 0;
    //stop timecounting
  }

  double pauseDistance = 0;

  Future<void> resume(String _totalWorkOutTime) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    isStopped = false;
    workOut.previousPoint.latitude = position.latitude;
    workOut.previousPoint.longitude = position.longitude;
    pauseDistance = Geolocator.distanceBetween(
        workOut.endPoint.latitude!,
        workOut.endPoint.longitude!,
        workOut.previousPoint.latitude!,
        workOut.previousPoint.longitude!)/1000;
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
    double dism = workOut.totalDistanceMiles;
    double s = workOut.currentSpeed;
    double mis = workOut.currentSpeedMiles;
    double ms = workOut.maxSpeed;
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
      workOut.currentSpeed = ((position.speed *18)/5);
      workOut.currentSpeedMiles = position.speed *2.2369362920544;
    });
  }

  Future<void> avgSpeed() async {
    if (workOut.totalDistance == 0.0) {
      workOut.avgSpeed = 0.0;
    } else {
      double avgSpeedResult =
          (workOut.totalDistance / workOut.secTime.toDouble()) * 3600;
      workOut.avgSpeed = avgSpeedResult;
    }
  }

  Future<void> maxSpeed() async{
    if(workOut.currentSpeed >= workOut.maxSpeed){
      workOut.maxSpeed = workOut.currentSpeed;
    }else{
      workOut.maxSpeed = workOut.maxSpeed;
    }
  }

  Future<void> totalDistance() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    workOut.currentPoint.latitude = position.latitude;
    workOut.currentPoint.longitude = position.longitude;
    // checkCurrentLocation();
    workOut.totalDistance += Geolocator.distanceBetween(
        workOut.previousPoint.latitude!,
        workOut.previousPoint.longitude!,
        workOut.currentPoint.latitude!,
        workOut.currentPoint.longitude!) /
        1000;
    workOut.totalDistance = workOut.totalDistance - pauseDistance;
    // workOut.totalDistance += workOut.totalDistance;
    workOut.totalDistanceMiles = (workOut.totalDistance / 1.609344);
    pauseDistance = 0;
  }

  Future<void> checkCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    workOut.currentPoint.latitude = position.latitude;
    workOut.currentPoint.longitude = position.longitude;
  }

  Future<void> getListPoint() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    mapPoint.add(LatLng(position.latitude, position.longitude));
    print(mapPoint.length);
  }

  Future<void> getAddressName() async{
    List<Placemark> placemarks = await placemarkFromCoordinates(workOut.currentPoint.latitude as double,workOut.currentPoint.longitude as double);
    Placemark place = placemarks[0];
    if(place.subLocality == null) {
      workOut.addressName = place.country;
    }else{
      workOut.addressName = "${place.subLocality}, ${place.country}";
    }
    // workOut.addressName = place.country;
  }

}
