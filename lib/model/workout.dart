import 'dart:convert';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';

// var mapPoint = List<LatLng>.empty(growable: true);

class Workout {
  String workoutId;
  int number;
  String startTime;
  String stopTime;
  String date;
  String addressName;
  String totalMovingTime;
  int secTime;
  double avgSpeed;
  double maxSpeedMi;
  double maxSpeed;
  double totalDistance;
  double totalDistanceMiles;
  double currentSpeed;
  double currentSpeedMiles;
  GeoPoint startPoint;
  GeoPoint endPoint;
  GeoPoint previousPoint;
  GeoPoint currentPoint;
  List<LatLng> mapPoints;

  Workout({
    this.workoutId = '',
    this.number = 1,
    this.startTime = '',
    this.stopTime = '',
    this.date = '',
    this.addressName = '',
    this.totalMovingTime = '',
    this.secTime = 0,
    this.avgSpeed = 0.0,
    this.maxSpeedMi = 0.0,
    this.maxSpeed = 0.0,
    this.totalDistance = 0.0,
    this.totalDistanceMiles = 0.0,
    this.currentSpeed = 0.0,
    this.currentSpeedMiles = 0.0,
    required this.startPoint,
    required this.endPoint,
    required this.previousPoint,
    required this.currentPoint,
    this.mapPoints = const [],
  });

  factory Workout.fromJson(Map<String, dynamic> json) {
    var listMapPointFromJson = json['mapPoints'] as List;
    List<LatLng> mapPointsList = new List<LatLng>.from(listMapPointFromJson);
    // var listMapPointFromJson = json['mapPoints'] as List;
    // List<MapPoint> mapPointsList = listMapPointFromJson.map((e) => MapPoint.fromJson(e)).toList();
    return Workout(
      workoutId: json['workoutId'],
      number: json['number'],
      startTime: json['startTime'],
      stopTime: json['stopTime'],
      date: json['date'],
      addressName: json['addressName'],
      totalMovingTime: json['totalMovingTime'],
      secTime: json['secTime'],
      avgSpeed: json['avgSpeed'],
      maxSpeedMi: json['maxSpeedMi'],
      maxSpeed: json['maxSpeed'],
      totalDistance: json['totalDistance'],
      totalDistanceMiles: json['totalDistanceMiles'],
      currentSpeed: json['currentSpeed'],
      currentSpeedMiles: json['currentSpeedMiles'],
      startPoint: json['startPoint'],
      endPoint: json['endPoint'],
      previousPoint: json['previousPoint'],
      currentPoint: json['currentPoint'],
      mapPoints: mapPointsList,
    );
  }

  Map<String, dynamic> toJson() => {
        'workoutId': workoutId,
        'number': number,
        'startTime': startTime,
        'stopTime': stopTime,
        'date': date,
        'addressName': addressName,
        'totalMovingTime': totalMovingTime,
        'secTime': secTime,
        'avgSpeed': avgSpeed,
        'maxSpeedMi': maxSpeedMi,
        'maxSpeed': maxSpeed,
        'totalDistance': totalDistance,
        'totalDistanceMiles': totalDistanceMiles,
        'currentSpeed': currentSpeed,
        'currentSpeedMiles': currentSpeedMiles,
        'startPoint': startPoint,
        'endPoint': endPoint,
        'previousPoint': previousPoint,
        'currentPoint': currentPoint,
        'mapPoints': mapPoints,
      };
}

class GeoPoint {
  double latitude;
  double longitude;

  GeoPoint({
    this.latitude = 0.0,
    this.longitude = 0.0,
  });
}

// class MapPoint {
//   double latitude;
//   double longitude;
//
//   MapPoint({
//     this.latitude = 0.0,
//     this.longitude = 0.0,
//   });
//
//   factory MapPoint.fromJson(Map<String, dynamic> json) => MapPoint(
//     latitude: json['latitude'],
//     longitude: json['longitude'],
//   );
//
//   Map<String, dynamic> toJson() => {
//     'latitude': latitude,
//     'longitude': longitude,
//   };
//
// }