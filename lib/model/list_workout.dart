import 'package:sprint/model/workout.dart';


const int number = 1;

class ListWorkout {
  List<Workout> workouts;

  // Setting? setting;

  ListWorkout({
    this.workouts = const [],
    // this.setting,
  });

  factory ListWorkout.fromJson(Map<String, dynamic> json) {
    var listWorkoutFromJson = json['workouts'] as List;
    List<Workout> workoutsList = listWorkoutFromJson.map((e) => Workout.fromJson(e)).toList();
    return ListWorkout(workouts: workoutsList);
  }


  Map<String, dynamic> toJson() => {
        'workouts': workouts,
      };
}

class Setting {
  bool isDarkMode;
  String priority;
  int distanceIndex;
  int tempIndex;

  Setting({
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
