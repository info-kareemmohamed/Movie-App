import 'package:flutter/material.dart';
import 'package:flutter_project/core/model/app_data.dart';
import 'package:flutter_project/core/model/main_user.dart';
import 'package:flutter_project/core/utils/app_colors.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
          brightness: Brightness.light,
          colorScheme: const ColorScheme.light(background: AppColors.white)),
      darkMode = ThemeData(
          brightness: Brightness.dark,
          colorScheme: const ColorScheme.dark(background: AppColors.darkTheme));

  static ThemeData setTheme() {
    return AppData.instance != null
        ? AppData.instance.Theme == AppColors.darkTheme
            ? darkMode
            : lightMode
        : darkMode;
  }
}
