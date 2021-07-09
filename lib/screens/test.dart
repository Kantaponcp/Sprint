import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprint/model/text_list.dart';
import 'package:sprint/style/text_style.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
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
                      child: buildHaveIcon(
                        Icon(Icons.date_range_outlined, color: Colors.white,), 'date'),
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
                          buildHaveIcon(
                              Icon(Icons.schedule_outlined, color: Colors.white,), 'time'),
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
                color: Colors.orange,
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
                        '1:30',
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
                    style: Style.SummaryButtonTextStyle,
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
                backgroundColor: Colors.white.withOpacity(0.3),
                foregroundColor: Colors.white,
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
              alignment: Alignment.bottomRight,
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

  Widget buildHaveIcon( Widget icon, String text,) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 15,
            height: 15,
            child: icon,
          ),
          Text(
            text,
            style: Style.SummaryTextStyle,
          ),
        ],
      ),
    );
  }
}
