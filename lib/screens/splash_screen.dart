import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 300,),
            Container(
              child: Image.asset(
                'assets/images/logo.png',
                height: 160,
                width: 160,
                alignment: Alignment.center,
              ),
              //  CircularProgressIndicator(
              //   valueColor: AlwaysStoppedAnimation<Color>(
              //       Theme.of(context).primaryColor),
              // ),
            ),
            SizedBox(height: 250,),
            Container(
              child: Text(
                'Sprint',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
