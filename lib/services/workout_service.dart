import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sprint/model/list_workout.dart';
import 'package:sprint/model/workout.dart';
import 'package:latlong2/latlong.dart';
import 'package:sprint/utils/workout_preferences.dart';
import '../model/global_variable.dart';
import 'package:geocoding/geocoding.dart';

class WorkoutService {
  // late Workout workout;
  late final DateTime startTime;
  late final DateTime stopTime;

  Future<void> start() async {
    // int num = listWorkout.workouts.last.number;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentWorkout = new Workout(
      number: (listWorkout.workouts.isNotEmpty)
          ? listWorkout.workouts.last.number + 1
          : currentWorkout.number + 1,
      workoutId: 'CYCLING# ' + currentWorkout.number.toString(),
      date: DateFormat('dd MMM yyyy').format(DateTime.now()),
      startTime: DateFormat('jm').format(DateTime.now()),
      startPoint: new MapPoint(
          latitude: position.latitude, longitude: position.longitude),
      endPoint: new MapPoint(),
      currentPoint: new MapPoint(),
      previousPoint: new MapPoint(
          latitude: position.latitude, longitude: position.longitude),
      avgSpeed: 0.0,
      currentSpeed: 0.0,
      currentSpeedMiles: 0.0,
      totalDistance: 0.0,
      totalDistanceMiles: 0.0,
      mapPoints: [],
    );
    startTime = DateTime.now();
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('listWorkout', jsonEncode(listWorkout));
    // currentWorkout.mapPoints.add(currentMapPoint);
    isStopped = false;
    isPressed = true;
    loopCalStat();
  }

  Future<void> stop(String totalMovingTime) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentWorkout.stopTime = DateFormat('jm').format(DateTime.now());
    currentWorkout.endPoint!.latitude = position.latitude;
    currentWorkout.endPoint!.longitude = position.longitude;
    currentWorkout.totalMovingTime = totalMovingTime;
    stopTime = DateTime.now();


    ///ToDo Set...
    listWorkout.workouts.add(currentWorkout);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('listWorkout', jsonEncode(listWorkout));
    // print('Answer: $json');
    isStopped = true;

    int sec = currentWorkout.secTime;
    print('this is secTime $sec');
    final durations = currentWorkout.secTime;
    var seconds = durations;
    var hours = (seconds ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((seconds ~/ 60) % 60).toString().padLeft(2, '0');
    // switch ()
    if (durations < 60) {
      currentWorkout.calTime = '$seconds';
    } else if (durations < 3600) {
      currentWorkout.calTime = '0.$minutes';
    } else {
      currentWorkout.calTime = '$hours.$minutes';
    }
  }

  Future<void> pause(String totalMovingTime) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    isStopped = true;
    currentWorkout.stopTime = DateFormat('jm').format(DateTime.now());
    currentWorkout.endPoint!.latitude = position.latitude;
    currentWorkout.endPoint!.longitude = position.longitude;
    currentWorkout.totalMovingTime = totalMovingTime;
    //stop timecounting
  }

  double pauseDistance = 0;

  Future<void> resume(String totalMovingTime) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    isStopped = false;
    currentWorkout.previousPoint!.latitude = position.latitude;
    currentWorkout.previousPoint!.longitude = position.longitude;
    pauseDistance = Geolocator.distanceBetween(
            currentWorkout.endPoint!.latitude,
            currentWorkout.endPoint!.longitude,
            currentWorkout.previousPoint!.latitude,
            currentWorkout.previousPoint!.longitude) /
        1000;
    loopCalStat();
    //resume timecounting
  }

  Future<void> loopCalStat() async {
    //TODO
    calStat();
    currentWorkout.previousPoint!.latitude =
        currentWorkout.currentPoint!.latitude;
    currentWorkout.previousPoint!.longitude =
        currentWorkout.currentPoint!.longitude;
    currentWorkout.secTime = currentWorkout.secTime;
    double? avg = currentWorkout.avgSpeed;
    int? sec = currentWorkout.secTime;
    double dis = currentWorkout.totalDistance;
    double dism = currentWorkout.totalDistanceMiles;
    double s = currentWorkout.currentSpeed;
    double mis = currentWorkout.currentSpeedMiles;
    double ms = currentWorkout.maxSpeed;
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
      currentWorkout.currentSpeed = ((position.speed * 18) / 5);
      currentWorkout.currentSpeedMiles = position.speed * 2.2369362920544;
    });
  }

  Future<void> avgSpeed() async {
    if (currentWorkout.totalDistance == 0.0) {
      currentWorkout.avgSpeed = 0.0;
    } else {
      double avgSpeedResult =
          (currentWorkout.totalDistance / currentWorkout.secTime.toDouble()) *
              3600;
      currentWorkout.avgSpeed = avgSpeedResult;
    }
  }

  Future<void> maxSpeed() async {
    if (currentWorkout.currentSpeed >= currentWorkout.maxSpeed ||
        currentWorkout.currentSpeedMiles >= currentWorkout.maxSpeedMi) {
      currentWorkout.maxSpeed = currentWorkout.currentSpeed;
      currentWorkout.maxSpeedMi = currentWorkout.currentSpeedMiles;
    } else {
      currentWorkout.maxSpeed = currentWorkout.maxSpeed;
      currentWorkout.maxSpeedMi = currentWorkout.maxSpeedMi;
    }
  }

  Future<void> totalDistance() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentWorkout.currentPoint!.latitude = position.latitude;
    currentWorkout.currentPoint!.longitude = position.longitude;
    // checkCurrentLocation();
    currentWorkout.totalDistance += Geolocator.distanceBetween(
          currentWorkout.previousPoint!.latitude,
          currentWorkout.previousPoint!.longitude,
          currentWorkout.currentPoint!.latitude,
          currentWorkout.currentPoint!.longitude,
        ) /
        1000;
    currentWorkout.totalDistance = currentWorkout.totalDistance - pauseDistance;
    currentWorkout.totalDistanceMiles =
        (currentWorkout.totalDistance / 1.609344);
    pauseDistance = 0.0;
  }

  Future<void> checkCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentWorkout.currentPoint!.latitude = position.latitude;
    currentWorkout.currentPoint!.longitude = position.longitude;
  }

  Future<void> getListPoint() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // mapPoint.add(LatLng(position.latitude, position.longitude));
    MapPoint currentMapPoint = new MapPoint(
      latitude: position.latitude,
      longitude: position.longitude,
    );
    currentWorkout.mapPoints!.add(currentMapPoint);
    print(currentWorkout.mapPoints!.length);
  }

  Future<void> getAddressName() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    noWorkoutAddress = "${place.subLocality}, ${place.country}";
    if (place.subLocality == null) {
      currentWorkout.addressName = place.country!;
    } else {
      currentWorkout.addressName = "${place.subLocality}, ${place.country}";
    }
  }
}
