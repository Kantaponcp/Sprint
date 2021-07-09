import 'package:flutter/material.dart';
import 'package:sprint/style/color.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LoadingButton extends StatefulWidget {
  @override
  LoadingButtonState createState() => LoadingButtonState();
}

class LoadingButtonState extends State<LoadingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    controller.addListener(() {
      setState(() {});
    });
  }

  final double width = 130.0;
  final double height = 130.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTapDown: (_) => controller.forward(),
        onTapUp: (_) {
          if (controller.status == AnimationStatus.forward) {
            controller.reverse();
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              child: CircularProgressIndicator(
                value: 1.0,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF0000)),
              ),
            ),
            Container(
              width: width,
              height: height,
              child: CircularPercentIndicator(
                backgroundWidth: 6,
                radius: width,
                percent: controller.value,
                lineWidth: 10,
                progressColor: SprintColors.red,
                backgroundColor: Color(0xFFFF0000).withOpacity(0.4),
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ),
            Icon(
              Icons.stop,
              color: SprintColors.red,
              size: 80,
            ),
          ],
        ),
      ),
    );
  }
}
