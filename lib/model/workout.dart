

WorkOut workOut = new WorkOut(startPoint: new GeoPoint(), endPoint: new GeoPoint());

class WorkOut {
  String? workoutId;
  DateTime? startTime;
  DateTime? stopTime;
  int? totalWorkOutTime;
  double? avgSpeed;
  double? totalDistance;
  double? currentSpeed;
  GeoPoint startPoint;
  GeoPoint endPoint;

  WorkOut({
    this.workoutId,
    this.startTime,
    this.stopTime,
    this.totalWorkOutTime,
    this.avgSpeed,
    this.totalDistance,
    this.currentSpeed,
    required this.startPoint,
    required this.endPoint,
});

  void newObject() {
    workOut = new WorkOut(startPoint: new GeoPoint(), endPoint: new GeoPoint());
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
