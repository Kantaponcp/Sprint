import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sprint/style/text_style.dart';

import 'color.dart';

class ThemeProvider extends ChangeNotifier {
  final String key = "theme";
  late SharedPreferences _prefs;
  bool _darkTheme = true;

  bool get darkTheme => _darkTheme;

  ThemeProvider() {
    _darkTheme;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, _darkTheme);
  }
// ThemeMode themeMode = ThemeMode.system;
// late SharedPreferences prefs;
//
// bool get isDarkMode {
//   if (themeMode == ThemeMode.system) {
//     final brightness = SchedulerBinding.instance!.window.platformBrightness;
//     return brightness == Brightness.dark;
//   } else {
//     return themeMode == ThemeMode.dark;
//   }
// }
//
// void toggleTheme(bool isOn) {
//   themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
//   notifyListeners();
// }
//
// _initPrefs() async {
//   if(prefs == null)
//     prefs = await SharedPreferences.getInstance();
// }
//
// _loadFromPrefs() async {
//   await _initPrefs();
//   isDarkMode
// }

}

class SprintThemes {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: SprintColors.black,
    fontFamily: AntonioName,
    primaryColor: SprintColors.orange,
    accentColor: SprintColors.grey,
    backgroundColor: SprintColors.black,
    cardColor: SprintColors.navy,
    buttonColor: SprintColors.orange,
    primaryIconTheme: IconThemeData(
      color: SprintColors.white,
    ),
    colorScheme: ColorScheme.dark(
        primary: SprintColors.white,
        secondary: SprintColors.orange,
        onPrimary: SprintColors.white,
        onSurface: SprintColors.white),
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: SprintColors.white,
    fontFamily: AntonioName,
    primaryColor: SprintColors.orange,
    accentColor: SprintColors.lightGrey,
    backgroundColor: SprintColors.white,
    cardColor: SprintColors.lightGrey,
    buttonColor: SprintColors.orange,
    primaryIconTheme: IconThemeData(
      color: SprintColors.darkNavy,
    ),
    textSelectionColor: SprintColors.darkNavy,
    colorScheme: ColorScheme.light(
      primary: SprintColors.darkNavy,
      secondary: SprintColors.orange,
      onPrimary: SprintColors.darkNavy,
      onSurface: SprintColors.darkNavy,
      onError: SprintColors.darkNavy,
    ),
  );
}
