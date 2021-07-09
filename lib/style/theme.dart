import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sprint/style/text_style.dart';

import 'color.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
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
    iconTheme: IconThemeData(
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
    iconTheme: IconThemeData(
      color: SprintColors.darkNavy,
    ),
    colorScheme: ColorScheme.light(
      primary: SprintColors.darkNavy,
      secondary: SprintColors.orange,
      onPrimary: SprintColors.darkNavy,
      onSurface: SprintColors.darkNavy,
      onError: SprintColors.darkNavy,
    ),
  );
}
