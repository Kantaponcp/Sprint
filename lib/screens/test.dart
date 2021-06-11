// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sprint/model/text_list.dart';
// import 'package:sprint/model/workout.dart';
// import 'package:sprint/services/workout_service.dart';
// import 'package:sprint/widget/buildButton_widget.dart';
// import 'package:sprint/widget/text_section.dart';
//
// class Test extends StatefulWidget {
//   @override
//   _TestState createState() => _TestState();
// }
//
// class _TestState extends State<Test> {
//
//   bool isPressed = false;
//
//   late String displayTime;
//
//   late Stopwatch _stopwatch;
//   late Timer _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     _stopwatch = Stopwatch();
//     _timer = new Timer.periodic(new Duration(milliseconds: 30), (timer) {
//       setState(() {});
//     });
//   }
//
//   String formatTime(int milliseconds) {
//     var secs = milliseconds ~/ 1000;
//     var hours = (secs ~/ 3600).toString().padLeft(2, '0');
//     var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
//     var seconds = (secs % 60).toString().padLeft(2, '0');
//     displayTime = "$hours:$minutes:$seconds";
//     return displayTime;
//     // return "$hours:$minutes:$seconds";
//   }
//
//   void handleStartStop() {
//     if (_stopwatch.isRunning) {
//       _stopwatch.stop();
//     } else {
//       _stopwatch.start();
//     }
//     setState(() {}); // re-render the page
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Expanded(
//                 flex: 1,
//                 child: Container(
//                     // color: Theme.of(context).primaryColor,
//                     )),
//             //Main section
//             Expanded(
//               flex: 7,
//               child: Container(
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//                   color: Colors.white,
//                 ),
//                 child: Column(
//                   children: [
//                     Expanded(
//                       flex: 8,
//                       child: Container(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             // Text(timeCountingDisplay, style: Theme.of(context).textTheme.headline1,),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             TextSection(
//                               formatTime(_stopwatch.elapsedMilliseconds),
//                               TextList().timeText,
//                               TextList().timeUnit,
//                             ),
//                             Divider(
//                               thickness: 3,
//                             ),
//                             TextSection(
//                               TextList().distanceDisplay,
//                               TextList().distanceText,
//                               TextList().distanceUnit,
//                             ),
//                             Divider(
//                               thickness: 3,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Container(
//                                   alignment: Alignment.center,
//                                   child: Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: [
//                                       TextSection(
//                                         TextList().currentSpeedDisplay!,
//                                         TextList().currentSpeedText,
//                                         TextList().speedUnit,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   alignment: Alignment.center,
//                                   child: Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: [
//                                       TextSection(
//                                         TextList().avgSpeedDisplay,
//                                         TextList().avgSpeedText,
//                                         TextList().speedUnit,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     //Button Section
//                     Expanded(
//                       flex: 4,
//                       child: Container(
//                         width: 400,
//                         height: 600,
//                         child: ListView(
//                           children: [
//                             isPressed
//                                 ? InkWell(
//                                     child: Column(
//                                       children: [
//                                         IconButton(
//                                           onPressed: () {},
//                                           icon: Icon(Icons.touch_app_outlined),
//                                           color: Colors.black12,
//                                           iconSize: 50,
//                                         ),
//                                         Text(
//                                           'Tap to Pause',
//                                           style:
//                                               TextStyle(color: Colors.black12),
//                                         ),
//                                         Text(
//                                           'Press and Hold to Stop',
//                                           style:
//                                               TextStyle(color: Colors.black12),
//                                         )
//                                       ],
//                                     ),
//                                     onTap: () {
//                                       setState(() {});
//                                     },
//                                     onLongPress: () async {
//                                       // _stopWatchTimer.onExecute
//                                       //     .add(StopWatchExecute.stop);
//                                       await WorkOutService().stop(displayTime);
//                                       print(displayTime);
//                                       _stopwatch.stop();
//                                       Navigator.of(context)
//                                           .pushNamed('/summary');
//                                       setState(() {});
//                                     },
//                                   )
//                                 : SizedBox(
//                                     width: 100,
//                                     height: 100,
//                                     child: Visibility(
//                                       visible: isVisible,
//                                       child: BuildButton(
//                                         padding: EdgeInsets.all(5),
//                                         onClicked: () async {
//                                           // _stopWatchTimer.onExecute
//                                           //     .add(StopWatchExecute.start);
//                                           print(workOut.startPoint.latitude);
//                                           print(workOut.startPoint.longitude);
//                                           await WorkOutService().start();
//                                           _stopwatch.start();
//                                           setState(() {
//                                             isVisible = !isVisible;
//                                             isPressed = true;
//                                           });
//                                         },
//                                         shape: CircleBorder(),
//                                         child: Text(
//                                           'GO',
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .button,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   bool isVisible = true;
//
//   Widget pressToPause() {
//     return GestureDetector(
//       onTap: () {},
//       child: Container(),
//     );
//   }
//
//   Widget workOutTextSection(String text, TextAlign textAlign) => Container(
//         child: Text(
//           text,
//           style: Theme.of(context).textTheme.bodyText1,
//           textAlign: textAlign,
//         ),
//       );
//
//   Widget buildIcon(Widget child) => SizedBox(
//         width: 30,
//         height: 30,
//         child: child,
//       );
//
//   Widget summary(
//     Widget child,
//     String desText,
//     String resultText,
//     String unitText,
//   ) =>
//       Container(
//         padding: EdgeInsets.fromLTRB(20, 15, 30, 5),
//         child: Row(
//           children: [
//             Expanded(
//               flex: 1,
//               child: buildIcon(child),
//             ),
//             Expanded(
//               flex: 4,
//               child: workOutTextSection(
//                 desText,
//                 TextAlign.left,
//               ),
//             ),
//             Expanded(
//               flex: 4,
//               child: workOutTextSection(
//                 resultText,
//                 TextAlign.right,
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child: workOutTextSection(
//                 unitText,
//                 TextAlign.right,
//               ),
//             ),
//           ],
//         ),
//       );
// }
