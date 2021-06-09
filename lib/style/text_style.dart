import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sprint/screens/splash_screen.dart';

const displayNumberSize = 64.0;
const regularTextSize = 12.0;
const mediumTextSize = 48.0;
const smallTextSize = 15.0;

const String fontName = 'Roboto';

const TimeNumberTextStyle = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.w700,
  fontSize: displayNumberSize,
  color: Colors.black,
);

const NumberTextStyle = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.w700,
  fontSize: mediumTextSize,
  color: Colors.black,
);

const BodyTextStyle = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.w400,
  fontSize: regularTextSize,
  color: Colors.black,
);

const ButtonTextStyle = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.w700,
  fontSize: mediumTextSize,
  color: Colors.white,
);

const SummaryTextStyle = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.w700,
  fontSize: smallTextSize,
  color: Colors.black,
);

const SplashTextStyle = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.w700,
  fontSize: smallTextSize,
  color: Color(0xFFFD7E18),
);