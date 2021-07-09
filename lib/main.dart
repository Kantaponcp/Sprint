import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sprint/screens/history.dart';
import 'package:sprint/screens/home.dart';
import 'package:sprint/screens/setting.dart';
import 'package:sprint/screens/splash_screen.dart';
import 'package:sprint/screens/start_countdown.dart';
import 'package:sprint/screens/test.dart';
import 'package:sprint/screens/woorkout_map.dart';
import 'package:sprint/screens/workout_summary.dart';
import 'package:sprint/screens/workout_start.dart';
import 'package:sprint/model/global_variable.dart';
import 'package:sprint/style/color.dart';
import 'package:sprint/style/text_style.dart';
import 'package:sprint/style/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          return MaterialApp(
            themeMode: themeProvider.themeMode,
            darkTheme: SprintThemes.darkTheme,
            theme: SprintThemes.lightTheme,
            // ThemeData(
              // textTheme: TextTheme(
              //   headline1: FocusTextStyle,
              //   headline2: NumberTextStyle,
              //   subtitle1: DescriptionTextStyle,
              //   button: ButtonTextStyle,
              //   bodyText1: SummaryTextStyle,
              //   subtitle2: SplashTextStyle,
            //   // ),
            // ),
            initialRoute: '/',
            routes: {
              '/': (context) => SplashScreen(),
              '/home': (context) => HomePage(),
              '/summary': (context) => SummaryPage(),
              '/test': (context) => Test(),
              '/startWorkout': (context) => StartWorkout(),
              '/startCountdown': (context) => StartCountDown(),
              '/setting': (context) => SettingPage(),
              '/history': (context) => HistoryPage(),
              '/workoutMap': (context) => WorkoutMap(),
            },
          );
        },
      );
}
