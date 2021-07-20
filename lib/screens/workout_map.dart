import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprint/model/global_variable.dart';
import 'package:sprint/model/list_workout.dart';
import 'package:sprint/model/text_list.dart';
import 'package:sprint/services/workout_service.dart';
import 'package:sprint/style/text_style.dart';
import 'package:sprint/utils/setting_preferences.dart';
import 'package:sprint/utils/workout_preferences.dart';
import 'package:sprint/widget/map.dart';
import 'package:sprint/widget/text_section.dart';
import 'package:sprint/widget/workout_appBar.dart';
import 'package:sprint/widget/time_counting.dart';

class WorkoutMap extends StatefulWidget {
  const WorkoutMap({Key? key,}) : super(key: key);

  @override
  _WorkoutMapState createState() => _WorkoutMapState();
}

class _WorkoutMapState extends State<WorkoutMap> {
  // late ListWorkout listWorkout;
  // late List<ListWorkout> list;
  late Setting setting;

  @override
  void initState() {
    super.initState();
    start();
    setState(() {});
    // list = WorkoutPreferences.getWorkouts();
    setting = SettingPreferences.getSetting();
  }

  void start() {
    timer = Timer.periodic(
          new Duration(milliseconds: 30), (timer) => setState(() {}));
  }

  // @override
  // void dispose() {
  //   timer!.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double mapHeight = (MediaQuery.of(context).size.height) / 1.7;
    bool isGestureVisible = true;

    final tempUnitCheck = setting.tempIndex;
    final distUnitCheck = setting.distanceIndex;
    final priorityDisplayCheck = setting.priority;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: WorkoutAppBar(),
      body: Stack(
        children: [
          Container(
            height: mapHeight,
            child: MapWidget(),
          ),
          Container(
            height: (MediaQuery.of(context).size.height) / 2,
            margin: EdgeInsets.only(top: mapHeight - 30),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              color: Theme.of(context).backgroundColor,
              // color: Colors.red,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (priorityDisplayCheck == 'Speed') ...[
                            FocusDisplay(
                              TextList().currentSpeedDisplay!,
                              TextList().currentSpeedText,
                              (distUnitCheck == 0)
                                  ? TextList().speedUnitKM
                                  : TextList().speedUnitMiles,
                            ),
                          ] else if (priorityDisplayCheck == 'Distance') ...[
                            FocusDisplay(
                              TextList().distanceDisplay,
                              TextList().distanceText,
                              (distUnitCheck == 0)
                                  ? TextList().distanceUnitMiles
                                  : TextList().distanceUnitKM,
                            ),
                          ] else if (priorityDisplayCheck == 'Average Speed') ...[
                            FocusDisplay(
                              TextList().avgSpeedDisplay,
                              TextList().avgSpeedText,
                              (distUnitCheck == 0)
                                  ? TextList().speedUnitMiles
                                  : TextList().speedUnitKM,
                            ),
                          ] else ...[
                            FocusTimeDisplay(
                              formatTime(stopwatch.elapsedMilliseconds),
                              TextList().timeText,
                            ),
                          ]
                        ],
                      )
                      //----Condition 1------------------------------------------

                      ),
                ),
                Expanded(
                  flex: 6,
                  child: isTapped
                      ? Center(
                          child: Text(
                            'Go Back To Resume',
                            style: Style.bodyText1,
                          ),
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
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
                                        .withOpacity(0.3),
                                    iconSize: 80,
                                  ),
                                  Text(
                                    'Tap to Pause',
                                    style: TextStyle(
                                      fontFamily: AntonioName,
                                      fontWeight: FontWeight.w400,
                                      fontSize: regularTextSize,
                                      color: Theme.of(context)
                                          .iconTheme
                                          .color!
                                          .withOpacity(0.3),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () async {
                              pause();
                              await WorkOutService().pause(displayTime);
                              isTapped = true;
                              setState(() {
                              });
                            },
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
