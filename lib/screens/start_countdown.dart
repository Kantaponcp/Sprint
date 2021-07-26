import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sprint/model/list_workout.dart';
import 'package:sprint/screens/workout_start.dart';
import 'package:sprint/services/workout_service.dart';
import 'package:sprint/style/text_style.dart';
import 'package:sprint/utils/workout_preferences.dart';

class StartCountDown extends StatefulWidget {
  StartCountDown({
    Key? key,
  }) : super(key: key);

  @override
  _StartCountDownState createState() => _StartCountDownState();
}

class _StartCountDownState extends State<StartCountDown> {
  late Timer _timer;
  int _start = 3;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        // for(_start; _start<3; _start--) {
        //   setState(() {
        //     _start;
        //   });
        // }
        if (_start == 1) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    start();
    Timer(Duration(seconds: 3), () async {
      Navigator.of(context).pushReplacementNamed('/startWorkout');
      // await WorkoutPreferences.setWorkout(listWorkout);
      await WorkoutService().start();
    });
    super.initState();
  }

  Future<void> start() async {
    await WorkoutService().getAddressName();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void countdown(int i) {
    for (i = 0; i < 3; i++) {
      setState(() {
        print(i);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: Center(
          child: Text(
            "$_start",
            style: Style.CountTimeTextStyle,
          ),
        ),
      ),
    );
  }
}
