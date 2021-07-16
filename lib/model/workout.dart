import 'dart:convert';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';

WorkOut workOut = new WorkOut(startPoint: new GeoPoint(), endPoint: new GeoPoint(), previousPoint: new GeoPoint(), currentPoint: new GeoPoint(),);
var mapPoint = List<LatLng>.empty(growable: true);
var listWorkOut = List<WorkOut>.empty(growable: true);
// WorkOut workOut = new WorkOut();

class WorkOut {
  int? workOutId;
  DateTime? startTime;
  DateTime? stopTime;
  DateTime? date;
  String? addressName;
  String? totalMovingTime;
  int secTime;
  double avgSpeed;
  double totalDistance;
  double totalDistanceMiles;
  double currentSpeed;
  GeoPoint startPoint;
  GeoPoint endPoint;
  GeoPoint previousPoint;
  GeoPoint currentPoint;
  PolylinePoint? workoutPoint;

  WorkOut({
    this.workOutId,
    this.startTime,
    this.stopTime,
    this.date,
    this.addressName,
    this.totalMovingTime,
    this.secTime = 0,
    this.avgSpeed = 0,
    this.totalDistance = 0.0,
    this.totalDistanceMiles = 0.0,
    this.currentSpeed = 0,
    required this.startPoint,
    required this.endPoint,
    required this.previousPoint,
    required this.currentPoint,
    this.workoutPoint
});

  void newObject() {
    workOut = new WorkOut(startPoint: new GeoPoint(), endPoint: new GeoPoint(), previousPoint: new GeoPoint(), currentPoint: new GeoPoint(),);
    mapPoint = new List<LatLng>.empty(growable: true);
    listWorkOut.add(workOut);
    for(int i=0; i<listWorkOut.length;i++){
    }
    // workOut = new WorkOut();
  }

  // static Map<String, dynamic> toMap(WorkOut workout) => {
  //   'workoutId': workout.workoutId,
  //   'startTime' : workout.startTime,
  //   'stopTime' : workout.stopTime,
  //   'totalMovingTime' : workout.totalMovingTime,
  //   'secTime' : workout.secTime,
  //   'avgSpeed' : workout.avgSpeed,
  //   'totalDistance' : workout.totalDistance,
  //   'totalDistanceMiles' : workout.totalDistanceMiles,
  //   'currentSpeed' : workout.currentSpeed,
  //   'startPoint' : workout.startPoint,
  //   'endPoint' : workout.endPoint,
  //   'previousPoint' : workout.previousPoint,
  //   'currentPoint' : workout.currentPoint,
  // };
  // static String encode(List<WorkOut> workouts) => json.encode(
  //   workouts
  //       .map<Map<String, dynamic>>((workout) => WorkOut.toMap(workout))
  //       .toList(),
  // );

}

class GeoPoint {
  double? latitude;
  double? longitude;

  GeoPoint({
    this.latitude,
    this.longitude,
});
}

class PolylinePoint {
  double? latitude;
  double? longitude;

  PolylinePoint({
    required this.longitude,
    required this.latitude,
});
}

// List<PolylinePoint> mapPoint = [
//   PolylinePoint(longitude: workOut.currentPoint.longitude, latitude: workOut.currentPoint.latitude),
// ];


