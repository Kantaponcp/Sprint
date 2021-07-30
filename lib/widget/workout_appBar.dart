import 'package:flutter/material.dart';
import 'package:sprint/model/global_variable.dart';
import 'package:sprint/model/list_workout.dart';
import 'package:sprint/model/text_list.dart';
import 'package:sprint/style/text_style.dart';
import 'package:sprint/model/weathermodel.dart';
import 'package:sprint/utils/setting_preferences.dart';
import 'package:sprint/utils/workout_preferences.dart';

class WorkoutAppBar extends StatefulWidget implements PreferredSizeWidget{
  WorkoutAppBar({
    Key? key,
  })  : preferredSize = Size.fromHeight(80),
        super(key: key);

  final Size preferredSize;

  @override
  _WorkoutAppBarState createState() => _WorkoutAppBarState();
}

class _WorkoutAppBarState extends State<WorkoutAppBar> {
  Setting setting = SettingPreferences.getSetting();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      // toolbarHeight: 80,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            //weather
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              child: CircleAvatar(
                // backgroundColor: Colors.gr.withOpacity(0.3),
                backgroundColor: Theme.of(context).accentColor,
                foregroundColor: Colors.white,
                radius: 50,
                //weather icon
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.network(weatherPNG),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                (tempUnitCheck)
                    ? tempDisplay
                    : tempDisplayFahrenheit,
                style: Style.TempAppBarStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                (setting.tempIndex == 1)
                    ? TextList().tempUnitCel
                    : TextList().tempUnitF,
                style: Style.TempAppBarStyle,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Container(
          width: 50,
          height: 50,
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(right: 20),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).accentColor,
            foregroundColor: Theme.of(context).iconTheme.color,
            radius: 50,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
                if(chosenValue == 'Time') {
                  dispose();
                }
              },
              icon: Icon(Icons.close),
            ),
          ),
        ),
      ],
    );
  }
}
