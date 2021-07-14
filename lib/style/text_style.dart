import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sprint/screens/splash_screen.dart';

import 'color.dart';

const focusNumberSize = 100.0;
const bigTextSize = 48.0;
const mediumTextSize = 28.0;
const regularTextSize = 15.0;
const smallTextSize = 12.0;

const Color HighLightTextColor = SprintColors.orange;
const Color TextColor = SprintColors.white;
const Color TextColor2 = SprintColors.black;

const String RobotoName = 'Roboto';
const String AntonioName = 'Antonio';

abstract class Style {
//Home
  static const title = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 100
  );

  static const headline1 = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: bigTextSize,
  );

  static const headline2 = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: mediumTextSize,
  );

  static const headline3 = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20,
  );

  static const headline4 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
  );

  static const bodyText1 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: regularTextSize,
  );

  // static const bodyText2 = TextStyle(
  //   fontWeight: FontWeight.w700,
  //   fontSize: 20,
  // );

  static const subTitle1 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: smallTextSize,
  );

  // static const subTitle2 = TextStyle(
  //   fontWeight: FontWeight.w700,
  //   fontSize: 20,
  // );

  static const button = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: bigTextSize,
    color: TextColor,
  );

  static const caption = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: smallTextSize,
  );

  static const HomeHeaderStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: bigTextSize,
    color: TextColor,
  );

  static const HomeSmallBodyStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: regularTextSize,
    color: HighLightTextColor,
  );

  static const HomeNumberStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: mediumTextSize,
    color: HighLightTextColor,
  );

  static const TempAppBarStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: mediumTextSize,
    color: TextColor2,
  );

  static const CountTimeTextStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: 200,
    color: HighLightTextColor,
  );

  static const HistorySmallTextStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: smallTextSize,
    color: HighLightTextColor,
  );

  static const SplashScreenTextStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: smallTextSize,
    color: HighLightTextColor,
  );
}
