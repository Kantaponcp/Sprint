import 'dart:async';
import 'package:sprint/model/weathermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sprint/model/text_list.dart';
import 'package:sprint/model/workout.dart';

bool isVisible = true;

late String displayTime;
late int secTime;

Stopwatch stopwatch = Stopwatch();
Timer? timer;

void pause() {
  if (timer != null) {
    timer!.cancel();
    stopwatch.stop();
  }
}

String formatTime(int milliseconds) {
  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');
  displayTime = "$hours:$minutes:$seconds";
  workOut.secTime = (milliseconds ~/ 1000);
  return displayTime;
  // return "$hours:$minutes:$seconds";
}

WeatherModel weather = WeatherModel();
int temperature = 0;
String tempDisplay = '';
String cityName = '';
String weatherMessage = '';
double newHeight = 0;
String weatherPNG = 'http://openweathermap.org/img/wn/03d@2x.png';
late SvgPicture svgBG;

void updateUI(dynamic weatherData) {
  if (weatherData == null) {
    //temperature = 0;
    tempDisplay = '--';
    weatherPNG = 'http://openweathermap.org/img/wn/03d@2x.png';
    //cityName = 'There is an error.';
    // svgBG = SvgPicture.asset('images/404-error.svg');
    return;
  }
  var temp = weatherData['main']['temp'];
  temperature = temp.toInt();
  tempDisplay = temperature.toString();
  var condition = weatherData['weather'][0]['id'];
  weatherPNG = weather.getWeatherPNGNetwork(condition);
  //cityName = weatherData['name'];
}

