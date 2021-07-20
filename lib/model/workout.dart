import 'dart:convert';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';

Workout workout = new Workout(
  startPoint: new GeoPoint(),
  endPoint: new GeoPoint(),
  previousPoint: new GeoPoint(),
  currentPoint: new GeoPoint(),
);

var mapPoint = List<LatLng>.empty(growable: true);
var listWorkout = List<Workout>.empty(growable: true);

class Workout {
  DateTime? startTime;
  DateTime? stopTime;
  DateTime? date;
  String? addressName;
  String? totalMovingTime;
  int secTime;
  double avgSpeed;
  double avgSpeedMi;
  double maxSpeed;
  double totalDistance;
  double totalDistanceMiles;
  double currentSpeed;
  double currentSpeedMiles;
  GeoPoint startPoint;
  GeoPoint endPoint;
  GeoPoint previousPoint;
  GeoPoint currentPoint;

  Workout({
    this.startTime,
    this.stopTime,
    this.date,
    this.addressName,
    this.totalMovingTime,
    this.secTime = 0,
    this.avgSpeed = 0.0,
    this.avgSpeedMi = 0.0,
    this.maxSpeed = 0.0,
    this.totalDistance = 0.0,
    this.totalDistanceMiles = 0.0,
    this.currentSpeed = 0.0,
    this.currentSpeedMiles = 0.0,
    required this.startPoint,
    required this.endPoint,
    required this.previousPoint,
    required this.currentPoint,
  });

  // Workout copy({
  //   DateTime? startTime,
  //   DateTime? stopTime,
  //   DateTime? date,
  //   String? addressName,
  //   String? totalMovingTime,
  //   int? secTime,
  //   double? avgSpeed,
  //   double? avgSpeedMi,
  //   double? maxSpeed,
  //   double? totalDistance,
  //   double? totalDistanceMiles,
  //   double? currentSpeed,
  //   double? currentSpeedMiles,
  //   GeoPoint? startPoint,
  //   GeoPoint? endPoint,
  //   GeoPoint? previousPoint,
  //   GeoPoint? currentPoint,
  // }) =>
  //     Workout(
  //       startTime: startTime ?? this.startTime,
  //       stopTime: stopTime ?? this.stopTime,
  //       date: date ?? this.date,
  //       addressName: addressName ?? this.addressName,
  //       totalMovingTime: totalMovingTime ?? this.totalMovingTime,
  //       secTime: secTime ?? this.secTime,
  //       avgSpeed: avgSpeed ?? this.avgSpeed,
  //       avgSpeedMi: avgSpeedMi ?? this.avgSpeedMi,
  //       maxSpeed: maxSpeed ?? this.maxSpeed,
  //       totalDistance: totalDistance ?? this.totalDistance,
  //       totalDistanceMiles: totalDistanceMiles ?? this.totalDistanceMiles,
  //       currentSpeed: currentSpeed ?? this.currentSpeed,
  //       currentSpeedMiles: currentSpeedMiles ?? this.currentSpeedMiles,
  //       startPoint: startPoint ?? this.startPoint,
  //       endPoint: endPoint ?? this.endPoint,
  //       previousPoint: previousPoint ?? this.previousPoint,
  //       currentPoint: currentPoint ?? this.currentPoint,
  //     );
  //
  // static Workout fromJson(Map<String, dynamic> json) => Workout(
  //       startTime: DateTime.tryParse(json['startTime']),
  //       stopTime: DateTime.tryParse(json['stopTime']),
  //       date: DateTime.tryParse(json['date']),
  //       addressName: json['addressName'],
  //       totalMovingTime: json['totalMovingTime'],
  //       secTime: json['secTime'],
  //       avgSpeed: json['avgSpeed'],
  //   avgSpeedMi: json['avgSpeedMi'],
  //       maxSpeed: json['maxSpeed'],
  //       totalDistance: json['totalDistance'],
  //       totalDistanceMiles: json['totalDistanceMiles'],
  //       currentSpeed: json['currentSpeed'],
  //       currentSpeedMiles: json['currentSpeedMiles'],
  //       startPoint: json['startPoint'],
  //       endPoint: json['endPoint'],
  //       previousPoint: json['previousPoint'],
  //       currentPoint: json['currentPoint'],
  //     );
  //
  // Map<String, dynamic> toJson() => {
  //       'startTime': startTime,
  //       'stopTime': stopTime,
  //       'date': date,
  //       'addressName': addressName,
  //       'totalMovingTime': totalMovingTime,
  //       'secTime': secTime,
  //       'avgSpeed': avgSpeed,
  //   'avgSpeedMi': avgSpeedMi,
  //       'maxSpeed': maxSpeed,
  //       'totalDistance': totalDistance,
  //       'totalDistanceMiles': totalDistanceMiles,
  //       'currentSpeed': currentSpeed,
  //       'currentSpeedMiles': currentSpeedMiles,
  //       'startPoint': startPoint,
  //       'endPoint': endPoint,
  //       'previousPoint': previousPoint,
  //       'currentPoint': currentPoint,
  //     };

  void newObject() {
    workout = new Workout(
      startPoint: new GeoPoint(),
      endPoint: new GeoPoint(),
      previousPoint: new GeoPoint(),
      currentPoint: new GeoPoint(),
    );
    mapPoint = new List<LatLng>.empty(growable: true);
    listWorkout.add(workout);
    // workOut = new WorkOut();
  }
}

class GeoPoint {
  double? latitude;
  double? longitude;

  GeoPoint({
    this.latitude,
    this.longitude,
  });
}
