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
  static const HomeTopicStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: mediumTextSize,
  );

  static const HomeHeaderStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: bigTextSize,
    color: TextColor,
  );

  static const HomeBodyStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: regularTextSize,
  );

  static const HomeSmallBodyStyle = TextStyle(
    fontFamily: RobotoName,
    fontWeight: FontWeight.w400,
    fontSize: regularTextSize,
    color: HighLightTextColor,
  );

  static const HomeNumberStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: mediumTextSize,
    color: HighLightTextColor,
  );

  static const HomeNumber2Style = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: HighLightTextColor,
  );

//

  static const TempAppBarStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: mediumTextSize,
    color: TextColor2,
  );

  static const FocusTextStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: focusNumberSize,
  );

  static const FocusDesTextStyle = TextStyle(
    fontFamily: RobotoName,
    fontWeight: FontWeight.w400,
    fontSize: 18,
  );

  static const NumberTextStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: bigTextSize,
  );

  static const TopicTextStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: bigTextSize,
    // color: TextColor,
  );

  static const DescriptionTextStyle = TextStyle(
    fontFamily: RobotoName,
    fontWeight: FontWeight.w400,
    fontSize: smallTextSize,
  );

  static const DescriptionSmallTextStyle = TextStyle(
    fontFamily: RobotoName,
    fontWeight: FontWeight.w400,
    fontSize: 10,
  );

  static const ButtonTextStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: bigTextSize,
    color: TextColor,
  );

  static const SplashTextStyle = TextStyle(
    fontFamily: RobotoName,
    fontWeight: FontWeight.w700,
    fontSize: regularTextSize,
    color: HighLightTextColor,
  );

  static const CountTimeTextStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: 200,
    color: HighLightTextColor,
  );

  static const SummaryTextStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: regularTextSize,
  );

  static const BodySpecialTextStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: 20,
  );

  static const BodyMediumTextStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: mediumTextSize,
  );

  static const BodyTextStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: regularTextSize,
  );

  static const BodySmallTextStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: smallTextSize,
  );

  static const HistorySmallTextStyle = TextStyle(
    fontFamily: RobotoName,
    fontWeight: FontWeight.w400,
    fontSize: smallTextSize,
    color: HighLightTextColor,
  );

  static const SummaryButtonTextStyle = TextStyle(
    fontFamily: AntonioName,
    fontWeight: FontWeight.w700,
    fontSize: mediumTextSize,
  );
}

