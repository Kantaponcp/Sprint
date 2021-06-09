import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprint/widget/buildButton_widget.dart';
import 'package:sprint/widget/text_section.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  TextList textList = TextList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  child: Image.asset(
                    'assets/images/cycling_1.jpg',
                    width: 600,
                    height: 600,
                    fit: BoxFit.cover,
                  ),
                )),
            //Main section
            Expanded(
              flex: 7,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Text(timeCountingDisplay, style: Theme.of(context).textTheme.headline1,),
                          SizedBox(
                            height: 30,
                          ),
                          Summary(
                            Icon(
                              Icons.schedule,
                            ),
                            textList.duration,
                            TextAlign.left,
                            '01:05:06.50',
                            TextAlign.right,
                          ),
                          Divider(),
                          Summary(
                            Icon(
                              Icons.schedule,
                            ),
                            textList.distanceText,
                            TextAlign.left,
                            '5.55',
                            TextAlign.right,
                          ),
                          Divider(),
                          Summary(
                            Icon(
                              Icons.schedule,
                            ),
                            textList.avgSpeedText,
                            TextAlign.left,
                            '20.5',
                            TextAlign.right,
                          ),
                          Divider(),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: BuildButton(
                              padding: EdgeInsets.all(15),
                              onClicked: () {
                                Navigator.of(context).pushNamed('/home');
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget workOutTextSection(
          @required String text, @required TextAlign textAlign) =>
      Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: textAlign,
        ),
      );

  Widget buildIcon(@required Widget child) => SizedBox(
        width: 30,
        height: 30,
        child: child,
      );

  Widget Summary(
    @required Widget child,
    @required String desText,
    @required TextAlign desTextAlign,
    @required String resultText,
    @required TextAlign resultTextAlign,
  ) =>
      Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: buildIcon(child),
            ),
            Expanded(
              flex: 4,
              child: workOutTextSection(
                desText,
                desTextAlign,
              ),
            ),
            Expanded(
              flex: 4,
              child: workOutTextSection(
                resultText,
                resultTextAlign,
              ),
            ),
          ],
        ),
      );
}
