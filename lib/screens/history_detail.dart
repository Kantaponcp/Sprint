import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sprint/model/global_variable.dart';
import 'package:sprint/model/list_workout.dart';
import 'package:sprint/model/text_list.dart';
import 'package:sprint/model/workout.dart';
import 'package:sprint/style/text_style.dart';
import 'package:sprint/utils/setting_preferences.dart';
import 'package:sprint/utils/workout_preferences.dart';
import 'package:sprint/widget/map.dart';

class HistoryDetail extends StatefulWidget {
  final int workoutIndex;

  const HistoryDetail({
    Key? key,
    required this.workoutIndex,
  }) : super(key: key);

  @override
  _HistoryDetailState createState() => _HistoryDetailState();
}

class _HistoryDetailState extends State<HistoryDetail> {

  @override
  void initState() {
    super.initState();
  }

  // getTotalTime() {
  //   final startTime = listWorkout.workouts[widget.workoutIndex].startTime!;
  //   final endTime = listWorkout.workouts[widget.workoutIndex].stopTime!;
  //   final diff = endTime.difference(startTime).inMilliseconds;
  //   var secs = diff ~/ 1000;
  //   var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  //   var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  //   var seconds = (secs % 60).toString().padLeft(2, '0');
  //   String? totalTime = '$hours:$minutes:$seconds';
  //   return totalTime;
  // }
  //
  // getStartTime() {
  //   return DateFormat('jm').format(listWorkout.workouts[widget.workoutIndex].startTime!);
  // }
  //
  // getEndTime() {
  //   return DateFormat('jm').format(listWorkout.workouts[widget.workoutIndex].stopTime!);
  // }

  Setting setting = SettingPreferences.getSetting();

  @override
  Widget build(BuildContext context) {

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
                  child: Text(listWorkout.workouts[widget.workoutIndex].workoutId, style: Style.headline1),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Container(
                        alignment: Alignment.center,
                        child:
                            buildHaveIcon(Icons.date_range_outlined, listWorkout.workouts[widget.workoutIndex].date),
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
                        listWorkout.workouts[widget.workoutIndex].addressName,
                        // 'Bangkae, Bangkok',
                        style: Style.bodyText1,
                      ),
                      buildHaveIcon(
                        Icons.schedule_outlined,
                        listWorkout.workouts[widget.workoutIndex].startTime + ' - ' + listWorkout.workouts[widget.workoutIndex].stopTime,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  child: MapIndexWidget(workoutIndex: widget.workoutIndex,),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                  child: Column(
                    children: [
                      buildShowStat(
                        TextList().distanceText,
                        Icon(Icons.directions_bike_outlined),
                        (distUnitCheck)
                            ? listWorkout.workouts[widget.workoutIndex]
                                .totalDistance
                                .toStringAsFixed(2)
                            : listWorkout.workouts[widget.workoutIndex]
                                .totalDistanceMiles
                                .toStringAsFixed(2),
                        (distUnitCheck)
                            ? TextList().distanceUnitKM
                            : TextList().distanceUnitMiles,
                      ),
                      buildShowStat(
                        TextList().sumAvgSpeedText,
                        Icon(Icons.shutter_speed_outlined),
                        (distUnitCheck)
                            ? listWorkout.workouts[widget.workoutIndex]
                            .avgSpeed
                            .toStringAsFixed(2)
                            : listWorkout.workouts[widget.workoutIndex]
                            .avgSpeedMi
                            .toStringAsFixed(2),
                        (distUnitCheck)
                            ? TextList().speedUnitKM
                            : TextList().speedUnitMiles,
                      ),
                      buildShowStat(
                        TextList().sumMaxSpeedText,
                        Icon(Icons.speed_outlined),
                        (distUnitCheck)
                            ? listWorkout.workouts[widget.workoutIndex]
                            .maxSpeed
                            .toStringAsFixed(2)
                            : listWorkout.workouts[widget.workoutIndex]
                            .maxSpeedMi
                            .toStringAsFixed(2),
                        (distUnitCheck)
                            ? TextList().speedUnitKM
                            : TextList().speedUnitMiles,
                      ),
                      buildShowStat(
                          TextList().sumMovingText,
                          Icon(Icons.timer_outlined),
                          listWorkout.workouts[widget.workoutIndex].totalMovingTime,
                          TextList().durationUnit),
                      buildShowStat(
                          TextList().duration,
                          Icon(Icons.schedule_outlined),
                          listWorkout.workouts[widget.workoutIndex].totalWorkoutTime,
                          TextList().durationUnit),
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
              Navigator.of(context).pop();
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Color(0xFFFF0000),
              alignment: Alignment.center,
              child: Text(
                'BACK',
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
