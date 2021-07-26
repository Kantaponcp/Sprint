import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sprint/model/global_variable.dart';
import 'package:sprint/model/list_workout.dart';
import 'package:sprint/model/text_list.dart';
import 'package:sprint/model/workout.dart';
import 'package:sprint/screens/start_countdown.dart';
import 'package:sprint/style/color.dart';
import 'package:sprint/style/text_style.dart';
import 'package:sprint/utils/setting_preferences.dart';
import 'package:sprint/utils/workout_preferences.dart';
import 'package:sprint/widget/appBar.dart';
import 'package:sprint/widget/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Setting setting = SettingPreferences.getSetting();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double appbarWidth = MediaQuery.of(context).size.width;
    final double appbarHeight = 70;

    final distUnitCheck = setting.distanceIndex;

    getDuration() {
      final duration = listWorkout.workouts.last.secTime;
      var seconds = duration;
      var hours = (seconds ~/ 3600).toString().padLeft(2, '0');
      var minutes = ((seconds ~/ 60) % 60).toString().padLeft(2, '0');
      if (duration < 60) {
        String? totalTime = '$seconds';
        return totalTime;
      } else if (duration < 3600) {
        String? totalTime = '0.$minutes';
        return totalTime;
      } else {
        String? totalTime = '$hours.$minutes';
        return totalTime;
      }
    }

    // getStartTime() {
    //   return DateFormat('jm').format(listWorkout.workouts.last.startTime!);
    // }
    //
    // getEndTime() {
    //   return DateFormat('jm').format(listWorkout.workouts.last.stopTime!);
    // }

    return SafeArea(
      child: Scaffold(
        endDrawer: MainDrawer(),
        body: Stack(
          children: [
            Positioned(
              left: 0,
              child: Container(
                width: appbarWidth,
                height: appbarHeight,
                child: HomeAppBar(),
              ),
            ),
            Positioned(
              left: 0,
              child: Container(
                width: appbarWidth - 50,
                height: appbarHeight,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(30)),
                  color: Theme.of(context).primaryColor,
                ),
                padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                alignment: Alignment.centerLeft,
                  child: Image.asset(
                    'assets/images/app_name.png',
                    fit: BoxFit.cover,
                  ),
              ),
            ),
            // Positioned(
            //   right: 0,
            //   child: Container(
            //     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            //     child: IconButton(
            //       onPressed: () {
            //         MainDrawer();
            //       },
            //       icon: Icon(Icons.menu_outlined),
            //       iconSize: 30,
            //     ),
            //   ),
            // ),
            Positioned(
              child: Container(
                margin: EdgeInsets.fromLTRB(15, appbarHeight, 15, 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 7,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                              child: listWorkout.workouts.isEmpty
                                  ? Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      elevation: 0,
                                      color: Theme.of(context).cardColor,
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 0),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'Last Workout',
                                                style: Style.headline2,
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 0),
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                DateFormat('dd MMM yyyy')
                                                    .format(DateTime.now()),
                                                style: Style.HomeSmallBodyStyle,
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Address: ' +
                                                        noWorkoutAddress,
                                                    style: Style
                                                        .HomeSmallBodyStyle,
                                                  ),
                                                  Text(
                                                    DateFormat('kk:mm:ss')
                                                        .format(DateTime.now()),
                                                    style: Style
                                                        .HomeSmallBodyStyle,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Expanded(
                                                    flex: 4,
                                                    child: buildShowStat(
                                                      TextList().distanceText,
                                                      Icons
                                                          .directions_bike_outlined,
                                                      '--',
                                                      (distUnitCheck == 0)
                                                          ? TextList()
                                                              .distanceUnitKM
                                                          : TextList()
                                                              .distanceUnitMiles,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: buildShowStat(
                                                      TextList().duration,
                                                      Icons.timer_outlined,
                                                      '--',
                                                      TextList().durationUnit,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: buildShowStat(
                                                      TextList().avgSpeedText,
                                                      Icons.av_timer_outlined,
                                                      '--',
                                                      (distUnitCheck == 0)
                                                          ? TextList()
                                                              .speedUnitKM
                                                          : TextList()
                                                              .speedUnitMiles,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  // Container(
                                  //         width: MediaQuery.of(context).size.width,
                                  //         height: 150,
                                  //         child: Card(
                                  //           shape: RoundedRectangleBorder(
                                  //             borderRadius:
                                  //                 BorderRadius.circular(20),
                                  //           ),
                                  //           color: Theme.of(context).cardColor,
                                  //           child: Center(
                                  //             child: Text(
                                  //               'No workout',
                                  //               style: Style.headline2,
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       )
                                  : Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      elevation: 0,
                                      color: Theme.of(context).cardColor,
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 0),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'Last Workout',
                                                style: Style.headline2,
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 0),
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                listWorkout.workouts.isEmpty
                                                    ? 'Date: --'
                                                    : listWorkout
                                                        .workouts.last.date,
                                                style: Style.HomeSmallBodyStyle,
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    listWorkout.workouts.last
                                                        .addressName,
                                                    style: Style
                                                        .HomeSmallBodyStyle,
                                                  ),
                                                  Text(
                                                    listWorkout.workouts.last
                                                            .startTime +
                                                        ' - ' +
                                                        listWorkout.workouts
                                                            .last.stopTime,
                                                    style: Style
                                                        .HomeSmallBodyStyle,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Expanded(
                                                    flex: 4,
                                                    child: buildShowStat(
                                                      TextList().distanceText,
                                                      Icons
                                                          .directions_bike_outlined,
                                                      listWorkout
                                                              .workouts.isEmpty
                                                          ? '--'
                                                          : listWorkout
                                                              .workouts
                                                              .last
                                                              .totalDistance
                                                              .toStringAsFixed(
                                                                  2),
                                                      (distUnitCheck == 0)
                                                          ? TextList()
                                                              .distanceUnitKM
                                                          : TextList()
                                                              .distanceUnitMiles,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: buildShowStat(
                                                      TextList().duration,
                                                      Icons.timer_outlined,
                                                      listWorkout
                                                              .workouts.isEmpty
                                                          ? '--'
                                                          : getDuration(),
                                                      (listWorkout.workouts.last
                                                                  .secTime <
                                                              60)
                                                          ? 'Sec'
                                                          : TextList()
                                                              .durationUnit,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: buildShowStat(
                                                      TextList().avgSpeedText,
                                                      Icons.av_timer_outlined,
                                                      listWorkout
                                                              .workouts.isEmpty
                                                          ? '--'
                                                          : listWorkout.workouts
                                                              .last.avgSpeed
                                                              .toStringAsFixed(
                                                                  2),
                                                      (distUnitCheck == 0)
                                                          ? TextList()
                                                              .speedUnitKM
                                                          : TextList()
                                                              .speedUnitMiles,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/images/banner.png',
                                  height: 120,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: Container(
                          width: 130,
                          height: 130,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: GestureDetector(
                            onTap: () async {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => StartCountDown()));
                              print('Press GO');
                              // await WorkOutService().checkCurrentLocation();
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 3)),
                              child: Text(
                                'GO',
                                style: Style.button,
                              ),
                            ),
                          ),
                        ),
                        // Container(
                        //   width: 130,
                        //   height: 130,
                        //   // margin: EdgeInsets.all(10),
                        //   decoration: BoxDecoration(
                        //     color: Theme.of(context).primaryColor,
                        //     shape: BoxShape.circle,
                        //     gradient: LinearGradient(colors: [SprintColors.orange, SprintColors.yellow],
                        //       begin: Alignment.topLeft,
                        //       end: Alignment.bottomRight,
                        //     ),
                        //     boxShadow: [
                        //       BoxShadow(
                        //         color: Color(0xFFFD7E18).withOpacity(0.5),
                        //         blurRadius: 50.0,
                        //         spreadRadius: 1.0,
                        //         offset: Offset(
                        //           1.0,
                        //           1.0,
                        //         ),
                        //       ),
                        //     ]
                        //   ),
                        //   child: FlatButton(
                        //     onPressed: () {},
                        //     padding: EdgeInsets.all(0.0),
                        //     child: Text(
                        //           'GO',
                        //           style: Style.button,
                        //         ),
                        //   ),
                        //   ),
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

  Widget buildShowStat(
    String disText,
    IconData icon,
    String number,
    String unit,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: Text(
            disText,
            style: Style.bodyText1,
          ),
        ),
        Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          child: CircleAvatar(
            backgroundColor: Theme.of(context).accentColor,
            foregroundColor: Theme.of(context).iconTheme.color,
            radius: 50,
            child: Icon(icon),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: Text(
            number,
            style: Style.HomeNumberStyle,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
          child: Text(
            unit,
            style: Style.caption,
          ),
        ),
      ],
    );
  }
}
