import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprint/model/text_list.dart';
import 'package:sprint/model/workout.dart';
import 'package:sprint/services/workout_service.dart';
import 'package:sprint/style/color.dart';
import 'package:sprint/style/text_style.dart';
import 'package:sprint/widget/build_button.dart';
import 'package:sprint/widget/test.dart';
import 'package:sprint/widget/text_section.dart';
import 'package:sprint/widget/workout_appBar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StartWorkout extends StatefulWidget {
  const StartWorkout({Key? key}) : super(key: key);

  @override
  _StartWorkoutState createState() => _StartWorkoutState();
}

class _StartWorkoutState extends State<StartWorkout>
    with SingleTickerProviderStateMixin {
  bool isPressed = false;
  bool isTapped = false;
  bool isVisible = true;
  bool isGestureVisible = true;
  bool isPauseVisible = true;

  late AnimationController controller;

  late String displayTime;
  late int secTime;

  late Stopwatch _stopwatch;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // controller.value = 0.0;
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    controller.addListener(() {
      setState(() {});
    });

    _stopwatch = Stopwatch();
    isVisible = true;
    start();
  }

  void start() {
    _timer = new Timer.periodic(new Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
    _stopwatch.start();
  }

  void pause() {
    if (_timer != null) {
      _timer.cancel();
      _stopwatch.stop();
    }
  }

  void resume() {
    if (displayTime != null) {
      _timer = Timer.periodic(new Duration(milliseconds: 30), (timer) {
        setState(() {});
      });
      _stopwatch.start();
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
                              child: Icon(Icons.thermostat_outlined),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              '30',
                              style: Style.HomeTopicStyle,
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
              flex: 5,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: FocusDisplay(
                        TextList().currentSpeedDisplay!,
                        TextList().currentSpeedText,
                        TextList().speedUnit,
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
                                TextList().distanceUnit,
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
                                TextList().speedUnit,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    TimeDisplay(
                      formatTime(_stopwatch.elapsedMilliseconds),
                      TextList().timeText,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: pauseWidget(),
              ),
            )
          ],
        ),
      ),
    );
  }

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
                          width: 100,
                          height: 100,
                          child: BuildButton(
                            padding: EdgeInsets.all(5),
                            onClicked: () async {
                              resume();
                              await WorkOutService().resume(displayTime);
                              isTapped = false;
                            },
                            shape: CircleBorder(),
                            child: Icon(
                              Icons.play_arrow,
                              color: SprintColors.orange,
                              size: 80,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: GestureDetector(
                          onTapDown: (_) {
                            controller.forward();
                            print('2');
                            if(controller.value == 1) {
                              print('3');
                            }
                          },
                          onTapUp: (_) async {
                            if (controller.status == AnimationStatus.forward) {
                              controller.reverse();
                              print('1');
                              print(controller.value);
                            }
                            // Navigator.of(context).pushNamed('/summary');
                            // _stopwatch
                            //   ..stop()
                            //   ..reset();
                            // await WorkOutService().stop(displayTime);
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                width: width,
                                height: height,
                                child: CircularPercentIndicator(
                                  backgroundWidth: 6,
                                  radius: width,
                                  percent: controller.value,
                                  lineWidth: 10,
                                  progressColor: SprintColors.red,
                                  backgroundColor:
                                      Color(0xFFFF0000).withOpacity(0.4),
                                  circularStrokeCap: CircularStrokeCap.round,
                                ),
                              ),
                              Icon(
                                Icons.stop,
                                color: SprintColors.red,
                                size: 80,
                              ),
                            ],
                          ),
                        ),
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
                            style: Style.DescriptionTextStyle,
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
                    // onLongPress: () async {
                    //   await WorkOutService().stop(displayTime);
                    //   print(displayTime);
                    //   _stopwatch
                    //     ..stop()
                    //     ..reset();
                    //   Navigator.of(context).pushNamed('/summary');
                    //   setState(
                    //         () {
                    //       // isStopVisible = !isStopVisible;
                    //       // isVisible = isVisible;
                    //       isPressed = false;
                    //     },
                    //   );
                    // },
                  ),
                ),
        ],
      );

// Widget stopButton() {
//   return GestureDetector(
//     onTapDown: (_) => controller.forward(),
//     onTapUp: (_) {
//       if (controller.status == AnimationStatus.forward) {
//         controller.reverse();
//       }
//     },
//     child: Stack(
//       alignment: Alignment.center,
//       children: <Widget>[
//         CircularProgressIndicator(
//           value: 1.0,
//           valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF0000)),
//         ),
//         CircularProgressIndicator(
//           value: controller.value,
//           valueColor: AlwaysStoppedAnimation<Color>(SprintColors.red),
//         ),
//         Icon(
//           Icons.stop,
//           color: Colors.white,
//           size: 80,
//         ),
//       ],
//     ),
//   );
// }

}
