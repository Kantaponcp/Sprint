import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sprint/model/list_workout.dart';
import 'package:sprint/model/workout.dart';
import 'package:sprint/utils/workout_preferences.dart';

class SettingPreferences {
  static late SharedPreferences _preferences;
  static const _keySetting = 'setting';

  static final mySetting = Setting(
    isDarkMode: false,
    priority: 'Speed',
    distanceIndex: 0,
    tempIndex: 0,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setSetting(Setting setting) async {
    final json = jsonEncode(setting.toJson());

    await _preferences.setString(_keySetting, json);
  }

  static Setting getSetting() {
    final json = _preferences.getString(_keySetting);

    return json == null ? mySetting : Setting.fromJson(jsonDecode(json));
  }
}