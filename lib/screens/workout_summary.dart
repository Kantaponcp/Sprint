import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sprint/model/text_list.dart';
import 'package:sprint/model/workout.dart';
import 'package:sprint/style/text_style.dart';
import 'package:sprint/widget/build_button.dart';
import 'package:sprint/widget/map.dart';

class SummaryPage extends StatefulWidget {
  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text('WORKOUT#4', style: Style.TopicTextStyle),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      child: buildHaveIcon(Icons.date_range_outlined, 'date'),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bangkae, Bangkok',
                            style: Style.SummaryTextStyle,
                          ),
                          buildHaveIcon(Icons.schedule_outlined, 'time'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: MapWidget(),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 20, 15, 10),
                child: Column(
                  children: [
                    buildShowStat(
                        TextList().distanceText,
                        Icon(Icons.directions_bike_outlined),
                        TextList().distanceDisplay,
                        TextList().distanceUnit),
                    buildShowStat(
                        TextList().avgSpeedText,
                        Icon(Icons.av_timer_outlined),
                        TextList().avgSpeedDisplay,
                        TextList().speedUnit),
                    buildShowStat(
                        TextList().duration,
                        Icon(Icons.timer_outlined),
                        TextList().totalWorkOutTime!,
                        TextList().durationUnit),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Color(0xFFFF0000),
                  alignment: Alignment.center,
                  child: Text(
                    'BACK',
                    textAlign: TextAlign.center,
                    style: Style.ButtonTextStyle,
                  ),
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
                style: Style.HomeBodyStyle,
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
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                unit,
                style: Style.HomeBodyStyle,
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
    return Row(
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
          alignment: Alignment.bottomLeft,
          child: Text(
            text,
            style: Style.BodySpecialTextStyle,
          ),
        ),
      ],
    );
  }
}
