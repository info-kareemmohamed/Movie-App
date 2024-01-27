import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/app/styles/icon_broken.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/features/favourite/favourite_screen.dart';
import 'package:flutter_project/features/home/screens/home_screen.dart';
import 'package:flutter_project/features/settings/settings_screen.dart';

part 'app_layout_state.dart';

class AppLayoutCubit extends Cubit<AppLayoutStates> {
  AppLayoutCubit() : super(InitialAppLayoutState());

  bool isDark = false;

  void changeMode() {
    isDark = !isDark;
    emit(ChangeModeState());
  }

  List<Widget> screens = const [
    FavouriteScreen(),
    HomeScreen(),
    SettingsScreen(),
  ];

  List<Widget> items = const [
    Icon(
      IconBroken.Heart,
      size: 30,
      color: AppColors.primary,
    ),
    Icon(
      IconBroken.Home,
      size: 30,
      color: AppColors.primary,
    ),
    Icon(
      IconBroken.Setting,
      size: 30,
      color: AppColors.primary,
    ),
  ];

  int currentIndex = 1;
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomState());
  }
}
