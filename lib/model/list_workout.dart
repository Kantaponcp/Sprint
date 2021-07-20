// import 'package:sprint/model/workout.dart';
//
// const int number = 1;
//
// class ListWorkout {
//   String workoutId;
//   Workout? workout;
//   Setting? setting;
//
//   ListWorkout({
//     this.workoutId = '',
//     this.workout,
//     this.setting,
//   });
//
//   ListWorkout copy({
//     String? workoutId,
//     Workout? workout,
//     Setting? setting,
//   }) =>
//       ListWorkout(
//         workoutId: workoutId ?? this.workoutId,
//         workout: workout ?? this.workout,
//         setting: setting ?? this.setting,
//       );
//
//   static ListWorkout fromJson(Map<String, dynamic> json) => ListWorkout(
//         workoutId: json['workoutId'],
//         workout: Workout.fromJson(json['workout']),
//         setting: Setting.fromJson(json['setting']),
//       );
//
//   Map<String, dynamic> toJson() => {
//         'workoutId': workoutId,
//         'workout': workout!.toJson(),
//         'setting': setting!.toJson(),
//       };
// }

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
