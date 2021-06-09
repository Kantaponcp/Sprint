import 'package:flutter/material.dart';
import 'package:sprint/screens/home.dart';
import 'package:sprint/screens/splashScreen.dart';
import 'package:sprint/screens/workoutSummary.dart';
import 'package:sprint/style/text_style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFFD7E18),
        scaffoldBackgroundColor: Color(0xFFFD7E18),
        backgroundColor: Colors.white,
        textTheme: TextTheme(
          headline1: TimeNumberTextStyle,
          headline2: NumberTextStyle,
          subtitle1: BodyTextStyle,
          button: ButtonTextStyle,
          bodyText1: SummaryTextStyle,
          subtitle2: SplashTextStyle,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomePage(),
        '/summary': (context) => SummaryPage(),
      },
    );
  }
}
