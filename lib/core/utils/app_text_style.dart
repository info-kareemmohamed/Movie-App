import 'package:flutter/material.dart';

class AppTextStyle {
  static const String fontFamily = "Montserrat";

  static TextStyle light({Color? color, double? fontSize}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w300,
        color: color,
      );

  static TextStyle regular({Color? color, double? fontSize}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle medium({Color? color, double? fontSize}) => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        color: color,
        fontSize: fontSize,
      );

  static TextStyle semiBold({Color? color, double? fontSize}) => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        color: color,
        fontSize: fontSize,
      );

  static TextStyle black({Color? color, double? fontSize}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        color: color,
      );
}
