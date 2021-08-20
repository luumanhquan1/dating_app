import 'package:dating_app/common/utils/color_hex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeDataSetUp {
  static TextStyle subtitle1Text = TextStyle(
      color: ColorsHex.getColorFromHex('#323755'),
      fontSize: 14.sp,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontFamily: "Ag");
  static TextStyle buttonText = TextStyle(
      color: ColorsHex.getColorFromHex('#FFFFFF'),
      fontSize: 16.sp,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      fontFamily: "Ag");
  static TextStyle headlineText = TextStyle(
      color: ColorsHex.getColorFromHex('#000000'),
      fontSize: 34.sp,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      fontFamily: "Ag");
  static TextStyle headline2Text = TextStyle(
      color: ColorsHex.getColorFromHex('#E94057'),
      fontSize: 24.sp,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      fontFamily: "Ag");

  static ThemeData themeDate = ThemeData(
    textTheme: TextTheme(
      subtitle1: subtitle1Text,
      button: buttonText,
      headline1: headlineText,
      headline2: headline2Text,
    ),
    canvasColor: ColorsHex.getColorFromHex('#000000'),
    backgroundColor: ColorsHex.getColorFromHex('#E5E5E5'),
    buttonColor: ColorsHex.getColorFromHex('#E94057'),
  );
}
