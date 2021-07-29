import 'package:sprint/model/list_workout.dart';
import 'package:sprint/model/workout.dart';
import 'package:sprint/utils/setting_preferences.dart';

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
Setting setting = SettingPreferences.getSetting();
bool distUnitCheck = setting.distanceIndex == 0;
ListWorkout listWorkout = new ListWorkout(workouts: []);
MapPoint currentMapPoint = new MapPoint();
Workout currentWorkout = new Workout(
);
