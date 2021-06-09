import 'package:flutter/material.dart';
import 'package:sprint/model/workOut.dart';
import 'package:sprint/model/timeCounting.dart';
import 'package:sprint/services/workOut_service.dart';
import 'package:sprint/widget/buildButton_widget.dart';
import 'package:sprint/widget/text_section.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextList textList = TextList();

  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;

  bool isPressed = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  color: Theme.of(context).primaryColor,
                )),
            //Main section
            Expanded(
              flex: 8,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Text(timeCountingDisplay, style: Theme.of(context).textTheme.headline1,),
                            SizedBox(
                              height: 20,
                            ),
                            StreamBuilder<int>(
                                stream: _stopWatchTimer.rawTime,
                                initialData: _stopWatchTimer.rawTime.value,
                                builder: (context, snapshot) {
                                  final value = snapshot.data;
                                  final displayTime =
                                      StopWatchTimer.getDisplayTime(value!,
                                          hours: _isHours);
                                  return Text(
                                    displayTime,
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  );
                                }),
                            Text(
                              TextList().timeText,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Divider(
                              thickness: 3,
                            ),
                            TextSection(
                              textList.distanceDisplay,
                              textList.distanceText,
                              textList.distanceUnit,
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
                                        textList.currentSpeedDisplay,
                                        textList.currentSpeedText,
                                        textList.speedUnit,
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
                                        textList.avgSpeedDisplay,
                                        textList.avgSpeedText,
                                        textList.speedUnit,
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
                        width: 300,
                        height: 300,
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
                                    onLongPress: () {
                                      _stopWatchTimer.onExecute
                                          .add(StopWatchExecute.stop);
                                      Navigator.of(context)
                                          .pushNamed('/summary');
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
                                          _stopWatchTimer.onExecute
                                              .add(StopWatchExecute.start);
                                          await WorkOutService().start();
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

  bool isVisible = true;

  Widget pressToPause() {
    return GestureDetector(
      onTap: () {},
      child: Container(),
    );
  }
}
