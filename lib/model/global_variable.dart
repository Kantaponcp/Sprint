import 'package:sprint/model/list_workout.dart';
import 'package:sprint/model/workout.dart';

bool isStopped = false;
bool isPressed = false;
bool isTapped = false;
bool isGestureVisible = true;
String chosenValue = 'Speed';
const keyDarkMode = 'key-dark-mode';
String noWorkoutAddress = '';
bool isKM = true;
bool isCel = true;
int tempIndex = 0;
int distIndex = 0;
ListWorkout listWorkout = new ListWorkout();
// MapPoint currentMapPoint = new MapPoint();
Workout currentWorkout = new Workout(
  startPoint: GeoPoint(),
  endPoint: GeoPoint(),
  currentPoint: GeoPoint(),
  previousPoint: GeoPoint(),
);
