// import 'dart:convert';
//
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sprint/model/workout.dart';
//
// class WorkoutPreferences {
//   static late SharedPreferences _preferences;
//   static const _keyWorkout = 'workout';
//
//   // static final mySetting = ListWorkout(
//   //   workoutId: 1,
//   // );
//
//   static Future init() async =>
//       _preferences = await SharedPreferences.getInstance();
//
//   static Future setWorkout(ListWorkout listWorkout) async {
//     final json = jsonEncode(listWorkout.toJson());
//
//     await _preferences.setString(_keyWorkout, json);
//   }
//
//   static ListWorkout getWorkout() {
//     final json = _preferences.getString(_keyWorkout);
//
//     return ListWorkout.fromJson(jsonDecode(json!));
//   }
// }