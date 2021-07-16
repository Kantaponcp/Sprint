import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sprint/model/global_variable.dart';
import 'package:sprint/model/text_list.dart';
import 'package:sprint/model/weathermodel.dart';
import 'package:sprint/model/workout.dart';
import 'package:sprint/services/workout_service.dart';
import 'package:sprint/style/color.dart';
import 'package:sprint/style/text_style.dart';
import 'package:sprint/widget/text_section.dart';
import 'package:sprint/widget/time_counting.dart';

class StartWorkout extends StatefulWidget {
  const StartWorkout({Key? key}) : super(key: key);

  @override
  _StartWorkoutState createState() => _StartWorkoutState();
}

class _StartWorkoutState extends State<StartWorkout> {
  bool isPressed = false;
  bool isTapped = false;
  bool isVisible = true;
  bool isGestureVisible = true;
  bool isPauseVisible = true;

  late AnimationController controller;

  // late String displayTime;
  // late int secTime;

  @override
  void initState() {
    super.initState();

    isVisible = true;
    start();
  }

  Future<void> start() async {
    timer = new Timer.periodic(new Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
    stopwatch.start();
    var weatherData = await weather.getLocationWeather();
    updateUI(weatherData);
  }

  void resume() {
    if (displayTime != null) {
      timer = Timer.periodic(new Duration(milliseconds: 30), (timer) {
        setState(() {});
      });
      stopwatch.start();
    }
  }

  // String formatTime(int milliseconds) {
  //   var secs = milliseconds ~/ 1000;
  //   var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  //   var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  //   var seconds = (secs % 60).toString().padLeft(2, '0');
  //   displayTime = "$hours:$minutes:$seconds";
  //   workOut.secTime = (milliseconds ~/ 1000);
  //   return displayTime;
  //   // return "$hours:$minutes:$seconds";
  // }

  final double width = 130.0;
  final double height = 130.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          //weather
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).accentColor,
                              foregroundColor:
                                  Theme.of(context).iconTheme.color,
                              radius: 50,
                              //weather icon
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: Image.network(weatherPNG),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              tempDisplay,
                              style: Style.headline2,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              (tempIndex == 0)
                                  ? TextList().tempUnitCel
                                  : TextList().tempUnitF,
                              style: Style.headline2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 20),
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).buttonColor,
                        foregroundColor: Colors.white,
                        radius: 50,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/workoutMap');
                          },
                          icon: Icon(Icons.map_outlined),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    //condition 1-----------------------------------------------
                    if (chosenValue == 'Speed') ...[
                      Container(
                        child: FocusDisplay(
                          TextList().currentSpeedDisplay!,
                          TextList().currentSpeedText,
                          (distIndex == 0)
                              ? TextList().speedUnitKM
                              : TextList().speedUnitMiles,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextSection(
                                  TextList().distanceDisplay,
                                  TextList().distanceText,
                                  (distIndex == 0)
                                      ? TextList().distanceUnitKM
                                      : TextList().distanceUnitMiles,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextSection(
                                  TextList().avgSpeedDisplay,
                                  TextList().avgSpeedText,
                                  (distIndex == 0)
                                      ? TextList().speedUnitKM
                                      : TextList().speedUnitMiles,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: TimeDisplay(
                          formatTime(stopwatch.elapsedMilliseconds),
                          TextList().timeText,
                        ),
                      ),
                      //condition 2-----------------------------------------------
                    ] else if (chosenValue == 'Distance') ...[
                      Container(
                        child: FocusDisplay(
                          TextList().distanceDisplay,
                          TextList().distanceText,
                          (distIndex == 0)
                              ? TextList().distanceUnitMiles
                              : TextList().distanceUnitKM,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextSection(
                                  TextList().currentSpeedDisplay!,
                                  TextList().currentSpeedText,
                                  (distIndex == 0)
                                      ? TextList().speedUnitMiles
                                      : TextList().speedUnitKM,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextSection(
                                  TextList().avgSpeedDisplay,
                                  TextList().avgSpeedText,
                                  (distIndex == 0)
                                      ? TextList().speedUnitMiles
                                      : TextList().speedUnitKM,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: TimeDisplay(
                          formatTime(stopwatch.elapsedMilliseconds),
                          TextList().timeText,
                        ),
                      ),
                      //condition 3-----------------------------------------------
                    ] else if (chosenValue == 'Average Speed') ...[
                      Container(
                        child: FocusDisplay(
                          TextList().avgSpeedDisplay,
                          TextList().avgSpeedText,
                          (distIndex == 0)
                              ? TextList().speedUnitMiles
                              : TextList().speedUnitKM,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextSection(
                                  TextList().currentSpeedDisplay!,
                                  TextList().currentSpeedText,
                                  (distIndex == 0)
                                      ? TextList().speedUnitMiles
                                      : TextList().speedUnitKM,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextSection(
                                  TextList().distanceDisplay,
                                  TextList().distanceText,
                                  (distIndex == 0)
                                      ? TextList().distanceUnitMiles
                                      : TextList().distanceUnitKM,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: TimeDisplay(
                          formatTime(stopwatch.elapsedMilliseconds),
                          TextList().timeText,
                        ),
                      ),
                      //condition 4-----------------------------------------------
                    ] else ...[
                      Container(
                        child: FocusTimeDisplay(
                          formatTime(stopwatch.elapsedMilliseconds),
                          TextList().timeText,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextSection(
                                  TextList().currentSpeedDisplay!,
                                  TextList().currentSpeedText,
                                  (distIndex == 0)
                                      ? TextList().speedUnitMiles
                                      : TextList().speedUnitKM,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextSection(
                                  TextList().avgSpeedDisplay,
                                  TextList().avgSpeedText,
                                  (distIndex == 0)
                                      ? TextList().speedUnitMiles
                                      : TextList().speedUnitKM,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(),
                            TextSection(
                              TextList().distanceDisplay,
                              TextList().distanceText,
                              (distIndex == 0)
                                  ? TextList().distanceUnitMiles
                                  : TextList().distanceUnitKM,
                            ),
                          ],
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: pauseWidget(),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Widget buildTime() {
  //   String twodigits(int n) => n.toString().padLeft(2, '0');
  //   final hours = twodigits(duration.inHours);
  //   final minutes = twodigits(duration.inMinutes.remainder(60));
  //   final seconds = twodigits(duration.inMinutes.remainder(60));
  // }

  Widget pauseWidget() => Stack(
        children: [
          isTapped
              ? Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: width,
                          height: height,
                          child: RaisedButton(
                            onPressed: () async {
                              resume();
                              await WorkOutService().resume(displayTime);
                              isTapped = false;
                            },
                            padding: EdgeInsets.all(5),
                            shape: CircleBorder(
                                side: BorderSide(
                              color: Theme.of(context).buttonColor,
                              width: 5,
                            )),
                            color: Colors.transparent,
                            elevation: 0,
                            child: Icon(
                              Icons.play_arrow,
                              color: SprintColors.orange,
                              size: 80,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: stopButton(),
                        // GestureDetector(
                        //   onTapDown: (_) {
                        //     controller.forward();
                        //     print('2');
                        //     if (controller.value == 1) {
                        //       print('3');
                        //     }
                        //   },
                        //   onTapUp: (_) async {
                        //     if (controller.status == AnimationStatus.forward) {
                        //       controller.reverse();
                        //       print('1');
                        //       print(controller.value);
                        //     }
                        //     // Navigator.of(context).pushNamed('/summary');
                        //     // _stopwatch
                        //     //   ..stop()
                        //     //   ..reset();
                        //     // await WorkOutService().stop(displayTime);
                        //   },
                        //   child: Stack(
                        //     alignment: Alignment.center,
                        //     children: <Widget>[
                        //       Container(
                        //         width: width,
                        //         height: height,
                        //         child: CircularPercentIndicator(
                        //           backgroundWidth: 6,
                        //           radius: width,
                        //           percent: controller.value,
                        //           lineWidth: 10,
                        //           progressColor: SprintColors.red,
                        //           backgroundColor:
                        //               Color(0xFFFF0000).withOpacity(0.4),
                        //           circularStrokeCap: CircularStrokeCap.round,
                        //         ),
                        //       ),
                        //       Icon(
                        //         Icons.stop,
                        //         color: SprintColors.red,
                        //         size: 80,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.height,
                  child: InkWell(
                    child: Visibility(
                      visible: isGestureVisible,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.touch_app_outlined),
                            color: Theme.of(context)
                                .iconTheme
                                .color!
                                .withOpacity(0.4),
                            iconSize: 100,
                          ),
                          Text(
                            'Tap to Pause',
                            style: TextStyle(
                              fontFamily: AntonioName,
                              fontWeight: FontWeight.w400,
                              fontSize: regularTextSize,
                              color: SprintColors.white.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () async {
                      pause();
                      await WorkOutService().pause(displayTime);
                      setState(() {
                        isTapped = true;
                      });
                    },
                  ),
                ),
        ],
      );

  Widget stopButton() {
    return SizedBox(
      width: width,
      height: height,
      child: RaisedButton(
        onPressed: () async {
          Navigator.of(context).pushNamed('/summary');
          stopwatch
            ..stop()
            ..reset();
          await WorkOutService().stop(displayTime);
        },
        padding: EdgeInsets.all(5),
        shape: CircleBorder(
            side: BorderSide(
          color: SprintColors.red,
          width: 5,
        )),
        color: Colors.transparent,
        elevation: 0,
        child: Icon(
          Icons.stop,
          color: SprintColors.red,
          size: 80,
        ),
      ),
    );
    //   GestureDetector(
    //   onTapDown: (_) async {
    //     controller.forward();
    //     if (controller.status == AnimationStatus.completed) {
    //         Navigator.of(context).pushNamed('/summary');
    //             _stopwatch
    //               ..stop()
    //               ..reset();
    //             await WorkOutService().stop(displayTime);
    //     }
    //   },
    //   onTapUp: (_) {
    //     if (controller.status == AnimationStatus.forward) {
    //       controller.reverse();
    //       print(AnimationStatus)
    //       ;
    //     }
    //   },
    //   child: Stack(
    //     alignment: Alignment.center,
    //     children: <Widget>[
    //       Container(
    //         width: width,
    //         height: height,
    //         child: CircularProgressIndicator(
    //           value: 1.0,
    //           valueColor: AlwaysStoppedAnimation<Color>(
    //               Color(0xFFFF0000).withOpacity(0.4)),
    //           strokeWidth: 6,
    //         ),
    //       ),
    //       Container(
    //         width: width,
    //         height: height,
    //         child: CircularProgressIndicator(
    //           value: controller.value,
    //           valueColor: AlwaysStoppedAnimation<Color>(SprintColors.red),
    //           strokeWidth: 10,
    //         ),
    //       ),
    //       Icon(
    //         Icons.stop,
    //         color: SprintColors.red,
    //         size: 80,
    //       ),
    //     ],
    //   ),
    // );
  }
}
