

import 'package:intl/intl.dart';

WorkOut workOut = new WorkOut(startPoint: new GeoPoint(), endPoint: new GeoPoint(), previousPoint: new GeoPoint(), currentPoint: new GeoPoint(),);

// WorkOut workOut = new WorkOut();

class WorkOut {

  String? workoutId;
  DateTime? startTime;
  DateTime? stopTime;
  String? totalWorkOutTime;
  int secTime;
  int avgSpeed;
  double totalDistance;
  int? currentSpeed;
  GeoPoint startPoint;
  GeoPoint endPoint;
  GeoPoint previousPoint;
  GeoPoint currentPoint;
  // GeoPoint? startPoint;
  // GeoPoint? endPoint;

  WorkOut({
    this.workoutId,
    this.startTime,
    this.stopTime,
    this.totalWorkOutTime,
    this.secTime = 0,
    this.avgSpeed = 0,
    this.totalDistance = 0.0,
    this.currentSpeed,
    required this.startPoint,
    required this.endPoint,
    required this.previousPoint,
    required this.currentPoint,
    // this.startPoint,
    // this.endPoint,
});

  void newObject() {
    workOut = new WorkOut(startPoint: new GeoPoint(), endPoint: new GeoPoint(), previousPoint: new GeoPoint(), currentPoint: new GeoPoint(),);

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
