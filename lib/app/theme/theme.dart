import 'package:flutter/material.dart';
import 'package:flutter_project/core/model/app_data.dart';
import 'package:flutter_project/core/utils/app_colors.dart';

class AppTheme extends ChangeNotifier {
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

  Locale? locale = Locale(AppData.instance.Language);

  ThemeData themeData =
      AppData.instance.Theme == AppColors.darkTheme ? darkMode : lightMode;
  Color color = AppData.instance.Theme;

  changeTheme(bool isDark) {
    if (isDark) {
      themeData = darkMode;
      color = AppColors.darkTheme;
    } else {
      themeData = lightMode;
      color = AppColors.white;
    }
    notifyListeners();
  }

  changeLanguage(String language) {
    this.locale = Locale(language);
    notifyListeners();
  }

  changeColor(Color color) {
    this.color = color;
    notifyListeners();
  }
}
