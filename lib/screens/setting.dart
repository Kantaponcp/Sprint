import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sprint/model/text_list.dart';
import 'package:sprint/model/global_variable.dart';
import 'package:sprint/style/color.dart';
import 'package:sprint/style/theme.dart';
import 'package:sprint/style/text_style.dart';
import 'package:sprint/widget/chang_theme_switch.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class Priority {
  final int id;
  final String title;

  Priority(
    this.id,
    this.title,
  );
}

class _SettingPageState extends State<SettingPage> {
  bool switchValue = true;

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
          'Settings',
          style: Style.headline2,
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
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Display',
                        style: Style.headline3,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: buildOption(Icons.dark_mode, 'Dark Mode'),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'On',
                                style: Style.bodyText1,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: ChangeThemeSwitch(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Unit',
                        style: Style.headline3,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: buildOption(
                                      Icons.directions_bike, 'Distance'),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(),
                                ),
                              ],
                            ),
                          ),
                          buildTab(
                              TextList().kilometer +
                                  ' (' +
                                  TextList().distanceUnitKM +
                                  ')',
                              TextList().mile +
                                  ' (' +
                                  TextList().distanceUnitMiles +
                                  ')', isOneSelected, distIndex),
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: buildOption(
                                      Icons.thermostat, 'Temperature'),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(),
                                ),
                              ],
                            ),
                          ),
                          buildTab(
                              TextList().celsius +
                                  ' (' +
                                  TextList().tempUnitCel +
                                  ')',
                              TextList().fahrenheit +
                                  ' (' +
                                  TextList().tempUnitF +
                                  ')', isTwoSelected, tempIndex),
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
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Priority',
                        style: Style.headline3,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).accentColor),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: chosenValue,
                          //elevation: 5,
                          style: Style.bodyText1,
                          items: <String>[
                            'Speed',
                            'Distance',
                            'Average Speed',
                            'Time',
                          ].map<DropdownMenuItem<String>>((String priorityValue) {
                            return DropdownMenuItem<String>(
                              value: priorityValue,
                              child: Text(priorityValue, style: Style.bodyText1,),
                            );
                          }).toList(),
                          // hint: Text(
                          //   "Please choose a langauage",
                          //   style: TextStyle(
                          //       color: Colors.black,
                          //       fontSize: 16,
                          //       fontWeight: FontWeight.w600),
                          // ),
                          onChanged: (String? priorityValue) {
                            setState(() {
                              chosenValue = priorityValue!;
                            });
                          },
                          dropdownColor: Theme.of(context).accentColor,
                        ),
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

  // Widget buildIOSSwitch() => Transform.scale(
  //       scale: 1.1,
  //       child: CupertinoSwitch(
  //         value: _light,
  //         activeColor: Theme.of(context).buttonColor,
  //         onChanged: (switchValue) {
  //             setState(() {
  //               _light = switchValue;
  //             });}
  //       ),
  //     );

  Widget buildOption(IconData icon, String text) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            width: 40,
            height: 40,
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              foregroundColor: Theme.of(context).iconTheme.color,
              radius: 50,
              child: Icon(icon),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10),
            child: Text(
              text,
              style: Style.bodyText1,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTab(String tab1, String tab2, List<bool> isSelected, int newIndex) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Container(
        // margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).accentColor,
          border: Border.all(color: SprintColors.grey, width: 1.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: ToggleButtons(
            isSelected: isSelected,
            selectedColor: SprintColors.darkNavy,
            // color: Colors.white,
            fillColor: SprintColors.white,
            disabledColor: Theme.of(context).accentColor,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width - 60) / 2,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  tab1,
                  style: TextStyle(
                    fontFamily: AntonioName,
                    fontWeight: FontWeight.w700,
                    fontSize: smallTextSize,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width - 50) / 2,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  tab2,
                  style: TextStyle(
                    fontFamily: AntonioName,
                    fontWeight: FontWeight.w700,
                    fontSize: smallTextSize,
                  ),
                ),
              ),
            ],
            onPressed: (newIndex) {
              setState(() {
                for (int index = 0; index < isSelected.length; index++) {
                  if (index == newIndex) {
                    isSelected[index] = true;
                  } else {
                    isSelected[index] = false;
                  }
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
