// import 'dart:convert';
//
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sprint/model/list_workout.dart';
// import 'package:sprint/model/workout.dart';
// import 'package:uuid/uuid.dart';
//
// // class GetPreferences {
// //
// //   void getWorkoutPref() {
// //     final id = Uuid().v4();
// //     print('Id: $id');
// //     ListWorkout listWorkout;
// //     listWorkout = listWorkout.workoutId == null ? WorkoutPreferences.getWorkout();
// //   }
// //
// // }
//
// class WorkoutPreferences {
//   static late SharedPreferences _preferences;
//   static const _keyWorkouts = 'workouts';
//
//   // static final mySetting = ListWorkout(
//   //   workoutId: 1,
//   // );
//
//   static Future init() async =>
//       _preferences = await SharedPreferences.getInstance();
//
//   // static Future setWorkout(ListWorkout listWorkout) async {
//   //   final json = jsonEncode(listWorkout.toJson());
//   //   final workoutId = listWorkout.workoutId;
//   //
//   //   await _preferences.setString(workoutId, json);
//   // }
//   static Future setWorkout(ListWorkout listWorkout) async {
//     final json = jsonEncode(listWorkout.toJson());
//
//     await _preferences.setString(_keyWorkouts, json);
//   }
//
//   static Setting getWorkout() {
//     final json = _preferences.getString(_keyWorkouts);
//
//     return Setting.fromJson(jsonDecode(json!));
//   }
//
//   // static ListWorkout getWorkout(String workoutId) {
//   //   final json = _preferences.getString(workoutId);
//   //
//   //   return ListWorkout.fromJson(jsonDecode(json!));
//   // }
//   //
//   // static Future addUsers(ListWorkout listWorkout) async {
//   //   final workoutsId = _preferences.getStringList(_keyWorkouts) ?? <String>[];
//   //   final newWorkoutsId = List.of(workoutsId)..add(listWorkout.workoutId);
//   //
//   //   await _preferences.setStringList(_keyWorkouts, newWorkoutsId);
//   // }
//   //
//   // static List<ListWorkout> getWorkouts() {
//   //   final workoutsId = _preferences.getStringList(_keyWorkouts);
//   //
//   //   if (workoutsId == null) {
//   //     return <ListWorkout>[];
//   //   } else {
//   //     return workoutsId.map<ListWorkout>(getWorkout).toList();
//   //   }
//   // }
// }