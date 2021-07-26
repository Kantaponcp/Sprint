import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sprint/model/list_workout.dart';
import 'package:sprint/model/workout.dart';
import 'package:uuid/uuid.dart';

class WorkoutPreferences {
  static late SharedPreferences _preferences;
  static const _keyWorkouts = 'workouts';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  // static Future setWorkout(ListWorkout listWorkout) async {
  //   final json = jsonEncode(listWorkout.toJson());
  //   final workoutId = listWorkout.workoutId;
  //
  //   await _preferences.setString(workoutId, json);
  // }
  static Future setWorkout(ListWorkout listWorkout) async {
    final json = jsonEncode(listWorkout.toJson());

    await _preferences.setString(_keyWorkouts, json);
  }

  static ListWorkout getWorkout() {
    final json = _preferences.getString(_keyWorkouts);

    return ListWorkout.fromJson(jsonDecode(json!));
  }

}