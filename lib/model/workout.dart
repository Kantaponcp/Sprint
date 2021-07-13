
WorkOut workOut = new WorkOut(startPoint: new GeoPoint(), endPoint: new GeoPoint(), previousPoint: new GeoPoint(), currentPoint: new GeoPoint(),);

// WorkOut workOut = new WorkOut();

class WorkOut {

  String? workoutId;
  DateTime? startTime;
  DateTime? stopTime;
  DateTime? date;
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
    this.workoutId,
    this.startTime,
    this.stopTime,
    this.date,
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

class PolylinePoint {
  double? latitude;
  double? longitude;

  PolylinePoint({
    required this.longitude,
    required this.latitude,
});
}