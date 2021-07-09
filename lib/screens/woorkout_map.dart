import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:sprint/model/text_list.dart';
import 'package:sprint/services/workout_service.dart';
import 'package:sprint/style/text_style.dart';
import 'package:sprint/widget/build_button.dart';
import 'package:sprint/widget/map.dart';
import 'package:sprint/widget/text_section.dart';
import 'package:sprint/widget/workout_appBar.dart';

class WorkoutMap extends StatefulWidget {
  const WorkoutMap({Key? key}) : super(key: key);

  @override
  _WorkoutMapState createState() => _WorkoutMapState();
}

class _WorkoutMapState extends State<WorkoutMap> {
  @override
  Widget build(BuildContext context) {
    double mapHeight = (MediaQuery.of(context).size.height) / 1.7;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: WorkoutAppBar(),
      body: Stack(
        children: [
          Container(
            height: mapHeight,
            child: MapWidget(),
          ),
          Container(
            height: (MediaQuery.of(context).size.height) / 2,
            margin: EdgeInsets.only(top: mapHeight - 30),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              color: Theme.of(context).backgroundColor,
              // color: Colors.red,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    alignment: Alignment.center,
                    child: FocusDisplay(
                      TextList().currentSpeedDisplay!,
                      TextList().currentSpeedText,
                      TextList().speedUnit,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: InkWell(
                      child: Visibility(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.touch_app_outlined),
                              color: Colors.white.withOpacity(0.3),
                              iconSize: 80,
                            ),
                            Text(
                              'Tap to Pause',
                              style: TextStyle(color: Colors.white.withOpacity(0.3)),
                            ),
                          ],
                        ),
                      ),
                      onTap: () async {
                        // pause();
                        // await WorkOutService().pause(displayTime);
                        // setState(() {
                        //   isTapped = true;
                        // });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
