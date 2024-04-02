import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/app/theme/theme.dart';
import 'package:flutter_project/core/helper/hive.dart';
import 'package:flutter_project/core/helper/navigation.dart';
import 'package:flutter_project/core/model/app_data.dart';
import 'package:flutter_project/core/services/datasource/remote/apiLinks/AllApi.dart';
import 'package:flutter_project/core/utils/Constants.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/features/settings/cubit/settings_states.dart';
import 'package:provider/provider.dart';


class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit() : super(InitialSettingsState());

  bool isDark = AppData.instance.Theme == AppColors.darkTheme;
  bool isAllow = AppData.instance.Notification;
  String selectedValue =
      AppData.instance.Language == ENGLISH ? 'English' : 'Arabic';
  final appTheme =
      Provider.of<AppTheme>(NavigationHelper.navigatorKey.currentContext!);

  void changeMode() {
    isDark = !isDark;
    AppData.instance.Theme = isDark ? AppColors.darkTheme : AppColors.white;
    appTheme.changeTheme(isDark);
    HiveHelper.AppBox.put(HiveHelper.AppKey, AppData.instance);
    emit(ChangeModeState());
  }

  void allowNotification() {
    isAllow = !isAllow;
    AppData.instance.Notification = isAllow;
    HiveHelper.AppBox.put(HiveHelper.AppKey, AppData.instance);
    emit(AllowNotificationState());
  }




  List<DropdownMenuItem<String>> dropDownMenu(String arabic, String english) {
    List<DropdownMenuItem<String>> dropMenuItems = [
      DropdownMenuItem(
        value: 'English',
        child: Text(
          english,
        ),
      ),
      DropdownMenuItem(
        value: 'Arabic',
        child: Text(
          arabic,
        ),
      ),
    ];
    return dropMenuItems;
  }

  void dropValue(String? value) async {
    selectedValue = value!;
    print(value);
    ApiUrl.instance.language=AppData.instance.Language = value == 'English' ? ENGLISH : ARABIC;
    appTheme.changeLanguage(AppData.instance.Language);
    HiveHelper.AppBox.put(HiveHelper.AppKey, AppData.instance);
    emit(ChangeLanguage());
  }
}
