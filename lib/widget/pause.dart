import 'package:flutter/material.dart';
import 'package:sprint/model/timeCounting.dart';

class Pause extends StatefulWidget {
  const Pause({Key? key}) : super(key: key);

  @override
  _PauseState createState() => _PauseState();
}

class _PauseState extends State<Pause> {

  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        isTapped ? InkWell(

        ) : InkWell(
          child: Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.touch_app_outlined),
                color: Colors.black,
                iconSize: 50,
              ),
              Text('Tap to Pause'),
              Text('Press and Hold to Stop')
            ],
          ),
          onTap: () {
            setState(() {
              isTapped = true;
            });
          },
          onLongPress: () {
          },
        ),
      ],
    );
  }
}
