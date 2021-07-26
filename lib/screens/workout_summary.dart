import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sprint/model/global_variable.dart';
import 'package:sprint/model/list_workout.dart';
import 'package:sprint/model/text_list.dart';
import 'package:sprint/style/text_style.dart';
import 'package:sprint/utils/setting_preferences.dart';
import 'package:sprint/widget/map.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key, }) : super(key: key);

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {

  @override
  void initState() {
    super.initState();
  }

  // getTotalTime() {
  //   final startTime = currentWorkout.startTime;
  //   final endTime = currentWorkout.stopTime!;
  //   final diff = endTime.difference(startTime).inMilliseconds;
  //   var secs = diff ~/ 1000;
  //   var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  //   var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  //   var seconds = (secs % 60).toString().padLeft(2, '0');
  //   String? totalTime = '$hours:$minutes:$seconds';
  //   return totalTime;
  // }

  // getStartTime() {
  //   DateTime startTime = currentWorkout.startTime ?? DateTime.now();
  //   return DateFormat('jm').format(startTime);
  // }
  //
  // getEndTime() {
  //   DateTime stopTime = currentWorkout.stopTime ?? DateTime.now();
  //   return DateFormat('jm').format(stopTime);
  // }

  Setting setting = SettingPreferences.getSetting();

  @override
  Widget build(BuildContext context) {
    final distUnitCheck = setting.distanceIndex == 0;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(currentWorkout.workoutId, style: Style.headline1),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Container(
                        // alignment: Alignment.center,
                        child:
                            buildHaveIcon(Icons.date_range_outlined, currentWorkout.date),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        currentWorkout.addressName,
                        // 'Bangkae, Bangkok',
                        style: Style.bodyText1,
                      ),
                      buildHaveIcon(
                        Icons.schedule_outlined,
                        currentWorkout.startTime + ' - ' + currentWorkout.stopTime,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  child: MapWidget(),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                  child: Column(
                    children: [
                      buildShowStat(
                        TextList().distanceText,
                        Icon(Icons.directions_bike_outlined),
                        (distUnitCheck)
                            ? currentWorkout.totalDistance
                                .toStringAsFixed(2)
                            : currentWorkout.totalDistanceMiles
                                .toStringAsFixed(2),
                        (distUnitCheck)
                            ? TextList().distanceUnitKM
                            : TextList().distanceUnitMiles,
                      ),
                      buildShowStat(
                        TextList().sumAvgSpeedText,
                        Icon(Icons.shutter_speed_outlined),
                        currentWorkout.avgSpeed.toStringAsFixed(2),
                        (distUnitCheck)
                            ? TextList().speedUnitKM
                            : TextList().speedUnitMiles,
                      ),
                      buildShowStat(
                        TextList().sumMaxSpeedText,
                        Icon(Icons.speed_outlined),
                        (distUnitCheck)
                            ? currentWorkout.maxSpeed
                            .toStringAsFixed(2)
                            : currentWorkout.maxSpeedMi
                            .toStringAsFixed(2),
                        (distUnitCheck)
                            ? TextList().speedUnitKM
                            : TextList().speedUnitMiles,
                      ),
                      buildShowStat(
                        TextList().sumMovingText,
                        Icon(Icons.timer_outlined),
                        currentWorkout.totalMovingTime,
                        TextList().durationUnit,
                      ),
                      buildShowStat(
                        TextList().duration,
                        Icon(Icons.schedule_outlined),
                        '00.37.48',
                        // '1.30',
                        TextList().durationUnit,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 80,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Color(0xFFFF0000),
              alignment: Alignment.center,
              child: Text(
                'HOME',
                textAlign: TextAlign.center,
                style: Style.button,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildShowStat(
    String disText,
    Widget icon,
    String number,
    String unit,
  ) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                foregroundColor: Theme.of(context).iconTheme.color,
                radius: 50,
                child: icon,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                disText,
                style: Style.bodyText1,
                // textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.bottomRight,
              child: Text(
                number,
                style: Style.HomeNumberStyle,
                // textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(left: 15),
              child: Text(
                unit,
                style: Style.bodyText1,
                // textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHaveIcon(
    IconData icon,
    String text,
  ) {
    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: Theme.of(context).iconTheme.color,
              size: 25,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            // alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: Style.headline3,
            ),
          ),
        ],
      ),
    );
  }
}
