import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sprint/model/global_variable.dart';
import 'package:sprint/model/text_list.dart';
import 'package:sprint/model/workout.dart';
import 'package:sprint/services/workout_service.dart';
import 'package:sprint/style/color.dart';
import 'package:sprint/style/text_style.dart';
import 'package:sprint/widget/appBar.dart';
import 'package:sprint/widget/build_button.dart';
import 'package:sprint/widget/drawer.dart';
import 'package:sprint/widget/text_section.dart';
import 'package:sprint/widget/time_counting.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  getDuration() {
    final duration = workOut.secTime;
    var seconds = duration ~/ 1000;
    var hours = (seconds ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    if(hours == '00'){
      String? totalTime = '$minutes';
      return totalTime;
    } else {
      String? totalTime = '$hours:$minutes';
      return totalTime;
    }
  }
  //
  // getDate() {
  //   DateTime? date = workOut.date;
  //   return DateFormat('dd MMM yyyy').format(date!);
  // }
  //
  // getStartTime() {
  //   return DateFormat('jm').format(workOut.startTime!);
  // }
  //
  // getEndTime() {
  //   return DateFormat('jm').format(workOut.stopTime!);
  // }

  @override
  Widget build(BuildContext context) {
    final double appbarWidth = MediaQuery.of(context).size.width;
    final double appbarHeight = 100;

    return Scaffold(
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
              width: appbarWidth - 60,
              height: appbarHeight,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(30)),
                  color: Theme.of(context).primaryColor,
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'SPRINT',
                    style: Style.HomeHeaderStyle,
                  ),
                ),
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
              margin: EdgeInsets.symmetric(vertical: appbarHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 7,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Card(
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
                                      padding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Last Workout',
                                        style: Style.headline2,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      padding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 0),
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '24 Jan 2021',
                                        style: Style.HomeSmallBodyStyle,
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                    Container(
                                      padding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Bangkae, Bangkok',
                                            style: Style.HomeSmallBodyStyle,
                                          ),
                                          Text(
                                            '14 PM' + ' - ' + '16 PM',
                                            style: Style.HomeSmallBodyStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: buildShowStat(
                                                TextList().distanceText,
                                                Icons.directions_bike_outlined,
                                                TextList().distanceDisplay,
                                                TextList().distanceUnitKM),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: buildShowStat(
                                                TextList().duration,
                                                Icons.timer_outlined,
                                                getDuration(),
                                                TextList().durationUnit),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: buildShowStat(
                                                TextList().avgSpeedText,
                                                Icons.av_timer_outlined,
                                                TextList().avgSpeedDisplay,
                                                TextList().speedUnitKM),
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
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 110,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(''),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      width: 130,
                      height: 130,
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          Navigator.of(context).pushNamed('/startCountdown');
                          print('press');
                          print(distIndex);
                          print(tempIndex);
                          // await WorkOutService().checkCurrentLocation();
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                              border:
                              Border.all(color: Colors.white, width: 3)),
                          child: Text(
                            'GO',
                            style: Style.button,
                          ),
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
