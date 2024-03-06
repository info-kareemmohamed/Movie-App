import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/model/app_data.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/features/settings/cubit/settings_states.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit() : super(InitialSettingsState());


  bool isDark = AppData.instance.Theme==AppColors.darkTheme;
  bool isAllow = AppData.instance.Notification;
  String selectedValue = "English";


  void changeMode() {
    isDark = !isDark;
    emit(ChangeModeState());
  }

  void allowNotification() {
    isAllow = !isAllow;
    emit(AllowNotificationState());
  }



  List<DropdownMenuItem<String>> dropMenuItems = const [
    DropdownMenuItem(
      value: 'English',
      child: Text(
        'English',
      ),
    ),
    DropdownMenuItem(
      value: 'Arabic',
      child: Text('Arabic'),
    ),
  ];

  void dropValue(String? value) {
    selectedValue = value!;
    emit(ChangeLanguage());
  }

}
