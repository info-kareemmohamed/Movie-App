import 'package:flutter/material.dart';

class AppTextStyle {
  static const String fontFamily = "Montserrat";

  static TextStyle light(
          {Color? color,
          double? fontSize,
          TextDecoration? decoration = TextDecoration.none}) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w300,
        color: color,
        decoration: decoration,
        decorationThickness: 2,
        decorationColor: Colors.white,
      );

  static TextStyle regular(
          {Color? color,
          double? fontSize,
          TextDecoration? decoration = TextDecoration.none}) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color,
        decoration: decoration,
        decorationThickness: 2,
        decorationColor: Colors.white,
      );

  static TextStyle medium(
          {Color? color,
          double? fontSize,
          TextDecoration? decoration = TextDecoration.none,
          double? thick}) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        color: color,
        fontSize: fontSize,
        decoration: decoration,
        decorationThickness: 2,
        decorationColor: Colors.white,
      );

  static TextStyle semiBold(
          {Color? color,
          double? fontSize,
          TextDecoration? decoration = TextDecoration.none}) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        color: color,
        fontSize: fontSize,
        decoration: decoration,
        decorationThickness: 2,
        decorationColor: Colors.white,
      );

  static TextStyle extraBold(
          {Color? color,
          double? fontSize,
          TextDecoration? decoration = TextDecoration.none}) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        color: color,
        decoration: decoration,
        decorationThickness: 2,
        decorationColor: Colors.white,
      );

  static TextStyle black(
          {Color? color,
          double? fontSize,
          TextDecoration? decoration = TextDecoration.none}) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        color: color,
        decoration: decoration,
        decorationThickness: 2,
        decorationColor: Colors.white,
      );
}
