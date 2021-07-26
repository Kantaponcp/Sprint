import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sprint/model/check_gps.dart';
import 'package:sprint/model/global_variable.dart';
import 'package:sprint/model/list_workout.dart';
import 'package:sprint/model/text_list.dart';
import 'package:sprint/style/text_style.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkGpsHelper().checkGps();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
    start();
    // String? listWorkoutJson = '';
    // SharedPreferences.getInstance().then((value) => listWorkoutJson = value.getString('listWorkout') ?? null);
    // if(listWorkoutJson != null) {
    //   listWorkout = ListWorkout.fromJson(jsonDecode(listWorkoutJson!));
    // }
  }

  start() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? json = pref.getString('listWorkout') ?? null;
    if(json != null) {
      listWorkout = ListWorkout.fromJson(jsonDecode(json));
    } else {
      print('No data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 300,
            // ),
            Expanded(
              flex: 9,
              child: Container(
                child: Image.asset(
                  'assets/images/logo_1.png',
                  height: 160,
                  width: 160,
                  alignment: Alignment.center,
                ),
                //  CircularProgressIndicator(
                //   valueColor: AlwaysStoppedAnimation<Color>(
                //       Theme.of(context).primaryColor),
                // ),
              ),
            ),
            // SizedBox(
            //   height: 220,
            // ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  'Version '+TextList().version,
                  style: Style.SplashScreenTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
