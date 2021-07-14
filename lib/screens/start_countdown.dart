import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sprint/model/global_variable.dart';
import 'package:sprint/model/weathermodel.dart';
import 'package:sprint/services/workout_service.dart';
import 'package:sprint/style/text_style.dart';

class StartCountDown extends StatefulWidget {
  const StartCountDown({Key? key}) : super(key: key);

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
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
    startTimer();
    Timer(Duration(seconds: 3), () async {
      Navigator.of(context).pushReplacementNamed('/startWorkout');
      await WorkOutService().start();
      var weatherData = await weather.getLocationWeather();
      WeatherModel().updateUI(weatherData);
    });
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
          child: Text("$_start", style: Style.CountTimeTextStyle,),
        ),
      ),
    );
  }
}
