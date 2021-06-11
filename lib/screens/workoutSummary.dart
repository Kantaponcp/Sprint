import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprint/model/text_list.dart';
import 'package:sprint/model/workout.dart';
import 'package:sprint/widget/buildButton_widget.dart';

class SummaryPage extends StatefulWidget {

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/cycling_1.jpg',
            height: 300,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(top: 270),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Color(0xFFC4C4C4),
              ),
              height: 65,
              child: Padding(
                padding: EdgeInsets.only(bottom: 5, left: 15),
                child: Row(
                  children: [
                    buildIcon(
                      Icon(
                        Icons.directions_bike_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: workOutTextSection(
                        TextList().topic,
                        TextAlign.left,
                      ),
                    )
                  ],
                ),
              ),
              // width: 300,
            ),
          ),
          //Main section
          Padding(
            padding: EdgeInsets.only(top: 320),
            child: Container(
              height: 500,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  summary(
                    Icon(
                      Icons.schedule,
                    ),
                    TextList().duration,
                    TextList().totalWorkOutTime!,
                    TextList().timeUnit,
                  ),
                  Divider(),
                  summary(
                    Icon(
                      Icons.schedule,
                    ),
                    TextList().distanceText,
                    TextList().totalDistance,
                    TextList().speedUnit,
                  ),
                  Divider(),
                  summary(
                    Icon(
                      Icons.schedule,
                    ),
                    TextList().sumAvgSpeedText,
                    TextList().summaryAvgSpeed,
                    TextList().speedUnit,
                  ),
                  Divider(),
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: BuildButton(
                      padding: EdgeInsets.all(15),
                      onClicked: () {
                        Navigator.of(context).pushReplacementNamed('/home');
                      },
                      shape: StadiumBorder(),
                      child: workOutTextSection(
                        'BACK',
                        TextAlign.center,
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

  Widget workOutTextSection(String text, TextAlign textAlign) => Container(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: textAlign,
        ),
      );

  Widget buildIcon(Widget child) => SizedBox(
        width: 30,
        height: 30,
        child: child,
      );

  Widget summary(
    Widget child,
    String desText,
    String resultText,
    String unitText,
  ) =>
      Container(
        padding: EdgeInsets.fromLTRB(20, 15, 30, 5),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: buildIcon(child),
            ),
            Expanded(
              flex: 4,
              child: workOutTextSection(
                desText,
                TextAlign.left,
              ),
            ),
            Expanded(
              flex: 4,
              child: workOutTextSection(
                resultText,
                TextAlign.right,
              ),
            ),
            Expanded(
              flex: 2,
              child: workOutTextSection(
                unitText,
                TextAlign.right,
              ),
            ),
          ],
        ),
      );
}
