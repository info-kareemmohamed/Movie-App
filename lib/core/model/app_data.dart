import 'dart:ui';

import 'package:flutter_project/core/utils/Constants.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:hive/hive.dart';

part 'app_data.g.dart'; // Generated file

@HiveType(typeId: 4)
class AppData {
  static AppData instance = AppData._internal();
  @HiveField(0)
  String Language;

  @HiveField(1)
  Color Theme;

  @HiveField(2)
  bool Notification;

  factory AppData() {
    return instance;
  }

  AppData._internal({
    this.Language = ENGLISH,
    this.Theme = AppColors.darkTheme,
    this.Notification = false,
  });

  static Color textColorNameToPrimary() {
    return instance.Theme == AppColors.darkTheme
        ? AppColors.lightYellow
        : AppColors.darkTheme;
  }

  static Color textColorNameToBase() {
    return instance.Theme == AppColors.darkTheme
        ? AppColors.white
        : AppColors.darkTheme;
  }
}
