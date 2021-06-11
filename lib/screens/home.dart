import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sprint/model/global_variable.dart';
import 'package:sprint/model/text_list.dart';
import 'package:sprint/model/workout.dart';
import 'package:sprint/services/workout_service.dart';
import 'package:sprint/widget/buildButton_widget.dart';
import 'package:sprint/widget/text_section.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isTapped = false;
  bool isVisible = true;


  late String displayTime;
  late int secTime;

  late Stopwatch _stopwatch;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    isVisible = true;
    _timer = new Timer.periodic(new Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    // color: Theme.of(context).primaryColor,
                    )),
            //Main section
            Expanded(
              flex: 7,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Text(timeCountingDisplay, style: Theme.of(context).textTheme.headline1,),
                            SizedBox(
                              height: 20,
                            ),
                            timeCountDisplay(
                              formatTime(_stopwatch.elapsedMilliseconds),
                              TextList().timeText,
                            ),
                            Divider(
                              thickness: 3,
                            ),
                            TextSection(
                              TextList().distanceDisplay,
                              TextList().distanceText,
                              TextList().distanceUnit,
                            ),
                            Divider(
                              thickness: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextSection(
                                        TextList().currentSpeedDisplay!,
                                        TextList().currentSpeedText,
                                        TextList().speedUnit,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                          ],
                        ),
                      ),
                    ),
                    //Button Section
                    Expanded(
                      flex: 4,
                      child: Container(
                        width: 400,
                        height: 600,
                        alignment: Alignment.center,
                        child: ListView(
                          children: [
                            isPressed
                                ? InkWell(
                                    child: Column(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.touch_app_outlined),
                                          color: Colors.black12,
                                          iconSize: 50,
                                        ),
                                        Text(
                                          'Tap to Pause',
                                          style:
                                              TextStyle(color: Colors.black12),
                                        ),
                                        Text(
                                          'Press and Hold to Stop',
                                          style:
                                              TextStyle(color: Colors.black12),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                      setState(() {});
                                    },
                                    onLongPress: () async {
                                      await WorkOutService().stop(displayTime);
                                      print(displayTime);
                                      _stopwatch.stop();
                                      Navigator.of(context)
                                          .pushNamed('/summary');
                                      setState(() {
                                        // isStopVisible = !isStopVisible;
                                        // isVisible = isVisible;
                                        isPressed = false;
                                      });
                                    },
                                  )
                                : SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Visibility(
                                      visible: isVisible,
                                      child: BuildButton(
                                        padding: EdgeInsets.all(5),
                                        onClicked: () async {
                                          print(workOut.startPoint.latitude);
                                          print(workOut.startPoint.longitude);
                                          await WorkOutService().start();
                                          _stopwatch.start();
                                          setState(() {
                                            isVisible = !isVisible;
                                            isPressed = true;

                                          });
                                        },
                                        shape: CircleBorder(),
                                        child: Text(
                                          'GO',
                                          style: Theme.of(context)
                                              .textTheme
                                              .button,
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isStopVisible = true;

  Widget timeCountDisplay(String number, String text) => Column(
        children: [
          Text(
            number,
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      );

// Widget pause() => Expanded(
//       child: InkWell(
//         child: ,
//         children: [
//           isTapped
//               ? InkWell(
//                   child: SizedBox(
//                     child: IconButton(
//                       onPressed: () {},
//                       icon: Icon(Icons.play_arrow),
//                       color: Colors.black12,
//                       iconSize: 60,
//                     ),
//                   ),
//                   onTap: () {
//                     setState(() {
//                       isVisible = isVisible;
//                     });
//                   },
//                   onLongPress: () async {
//                     await WorkOutService().stop(displayTime);
//                     print(displayTime);
//                     _stopwatch.stop();
//                     Navigator.of(context).pushNamed('/summary');
//                     setState(() {});
//                   },
//                 )
//               : InkWell(
//                   child: Visibility(
//                     visible: isStopVisible,
//                     child: Column(
//                       children: [
//                         IconButton(
//                           onPressed: () {},
//                           icon: Icon(Icons.touch_app_outlined),
//                           color: Colors.black12,
//                           iconSize: 50,
//                         ),
//                         Text(
//                           'Tap to Pause',
//                           style: TextStyle(color: Colors.black12),
//                         ),
//                         Text(
//                           'Press and Hold to Stop',
//                           style: TextStyle(color: Colors.black12),
//                         )
//                       ],
//                     ),
//                   ),
//                   onTap: () {
//                     setState(() {});
//                   },
//                   onLongPress: () async {
//                     await WorkOutService().stop(displayTime);
//                     print(displayTime);
//                     _stopwatch.stop();
//                     Navigator.of(context).pushNamed('/summary');
//                     setState(() {
//                       isStopVisible = !isStopVisible;
//                     });
//                   },
//                 ),
//         ],
//       ),
//     );
}
