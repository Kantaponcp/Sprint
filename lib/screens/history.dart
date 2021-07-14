import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprint/model/text_list.dart';
import 'package:sprint/style/text_style.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  'CYCLING #5',
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
                                      child: Text('24 Jan 2021', style: Style.bodyText1,),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 5),
                                      alignment: Alignment.centerRight,
                                      child: Text('4:30 PM - 6:00 PM', style: Style.bodyText1,),
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
                        child: Text('Bangkae, Bangkok', style: Style.HistorySmallTextStyle,),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: buildShowStat(
                                  Icons.directions_bike_outlined,
                                  TextList().distanceDisplay,
                                  TextList().distanceUnitKM),
                            ),
                            Expanded(
                              flex: 4,
                              child: buildShowStat(Icons.timer_outlined, '1:30',
                                  TextList().durationUnit),
                            ),
                            Expanded(
                              flex: 4,
                              child: buildShowStat(
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
          ],
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
      alignment: Alignment.center,
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
            child: Text(
              number,
              style: Style.HomeNumberStyle,
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
