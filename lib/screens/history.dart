import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sprint/model/text_list.dart';
import 'package:sprint/model/workout.dart';
import 'package:sprint/style/text_style.dart';
import 'package:sprint/utils/setting_preferences.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  Setting setting = SettingPreferences.getSetting();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            'History',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: mediumTextSize,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          actions: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                foregroundColor: Theme.of(context).iconTheme.color,
                radius: 50,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/home');
                  },
                  icon: Icon(Icons.close),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: listWorkOut.isEmpty
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Theme.of(context).cardColor,
                          child: Center(
                            child: Text(
                              'No workout',
                              style: Style.bodyText1,
                            ),
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: listWorkOut.length,
                        itemBuilder: (context, index) {
                          return buildCard(index);
                        }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(int index) {
    var duration = listWorkOut[index].secTime;

    getDuration() {
      var seconds = duration;
      var hours = (seconds ~/ 3600).toString().padLeft(2, '0');
      var minutes = ((seconds ~/ 60) % 60).toString().padLeft(2, '0');
      // switch ()
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

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Theme.of(context).cardColor,
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Container(
                          child: Text(
                            'CYCLING#',
                            style: Style.headline2,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  DateFormat('dd MMM yyyy')
                                      .format(listWorkOut[index].date!),
                                  style: Style.bodyText1,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  DateFormat('jm').format(
                                          listWorkOut[index].startTime!) +
                                      ' - ' +
                                      DateFormat('jm')
                                          .format(listWorkOut[index].stopTime!),
                                  style: Style.bodyText1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    listWorkOut[index].addressName!,
                    style: Style.HistorySmallTextStyle,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: buildShowStat(
                          Icons.directions_bike_outlined,
                          listWorkOut[index].totalDistance.toStringAsFixed(2),
                          TextList().distanceUnitKM,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: buildShowStat(
                          Icons.timer_outlined,
                          getDuration(),
                          (duration < 60) ? 'Sec' : TextList().durationUnit,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: buildShowStat(
                          Icons.av_timer_outlined,
                          listWorkOut[index].avgSpeed.toStringAsFixed(2),
                          TextList().speedUnitKM,
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
    );
  }

  Widget buildShowStat(
    IconData icon,
    String number,
    String unit,
  ) {
    return Container(
      // alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 25,
            height: 25,
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              foregroundColor: Theme.of(context).iconTheme.color,
              radius: 50,
              child: Icon(
                icon,
                size: 15,
              ),
            ),
          ),
          Container(
            // padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
            alignment: Alignment.centerRight,
            child: Text(
              number,
              style: Style.HomeNumberStyle,
              textAlign: TextAlign.right,
            ),
          ),
          Container(
            // padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
            alignment: Alignment.bottomRight,
            child: Text(
              unit,
              style: Style.HomeSmallBodyStyle,
            ),
          ),
        ],
      ),
    );
  }
}
