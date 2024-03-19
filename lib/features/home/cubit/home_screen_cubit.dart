import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/home/model/MovieResponse.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());
  late List<MovieResponse> movies;
  String selectedValue = "Daily";

  List<DropdownMenuItem<String>> dropDownMenu(String daily, String weekly) {
    List<DropdownMenuItem<String>> dropMenuItems = [
      DropdownMenuItem(
        value: 'Daily',
        child: Text(daily),
      ),
      DropdownMenuItem(
        value: 'Weekly',
        child: Text(weekly),
      ),
    ];
    return dropMenuItems;
  }

  void dropValue(String? value) {
    selectedValue = value!;
    emit(SelectedValueState());
  }
}
