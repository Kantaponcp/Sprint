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
var listWorkOut = List<Workout>.empty(growable: true);
// WorkOut workOut = new WorkOut();

class Workout {
  DateTime? startTime;
  DateTime? stopTime;
  DateTime? date;
  String? addressName;
  String? totalMovingTime;
  int secTime;
  double avgSpeed;
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
    this.avgSpeed = 0,
    this.maxSpeed = 0.0,
    this.totalDistance = 0.0,
    this.totalDistanceMiles = 0.0,
    this.currentSpeed = 0,
    this.currentSpeedMiles = 0,
    required this.startPoint,
    required this.endPoint,
    required this.previousPoint,
    required this.currentPoint,
  });

  void newObject() {
    workout = new Workout(
      startPoint: new GeoPoint(),
      endPoint: new GeoPoint(),
      previousPoint: new GeoPoint(),
      currentPoint: new GeoPoint(),
    );
    mapPoint = new List<LatLng>.empty(growable: true);
    listWorkOut.add(workout);
    for (int i = 0; i < listWorkOut.length; i++) {}
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

class ListWorkout {
  final int workoutId;
  final Workout workout;

  const ListWorkout({
    required this.workoutId,
    required this.workout,
  });

  ListWorkout copy({
    int? workoutId,
    Workout? workout,
  }) =>
      ListWorkout(
        workoutId: workoutId ?? this.workoutId,
        workout: workout ?? this.workout,
      );

  static ListWorkout fromJson(Map<String, dynamic> json) => ListWorkout(
        workoutId: json['workoutId'],
        workout: json['workout'],
      );

  Map<String, dynamic> toJson() => {
        'workoutId': workoutId,
        'workout': workout,
      };
}

class Setting {
  final bool isDarkMode;
  final String priority;
  final int distanceIndex;
  final int tempIndex;

  const Setting({
    required this.isDarkMode,
    required this.priority,
    required this.distanceIndex,
    required this.tempIndex,
  });

  Setting copy({
    bool? isDarkMode,
    String? priority,
    int? distanceIndex,
    int? tempIndex,
  }) =>
      Setting(
        isDarkMode: isDarkMode ?? this.isDarkMode,
        priority: priority ?? this.priority,
        distanceIndex: distanceIndex ?? this.distanceIndex,
        tempIndex: tempIndex ?? this.tempIndex,
      );

  static Setting fromJson(Map<String, dynamic> json) => Setting(
        isDarkMode: json['isDarkMode'],
        priority: json['priority'],
        distanceIndex: json['distanceIndex'],
        tempIndex: json['tempIndex'],
      );

  Map<String, dynamic> toJson() => {
        'isDarkMode': isDarkMode,
        'priority': priority,
        'distanceIndex': distanceIndex,
        'tempIndex': tempIndex,
      };
}
