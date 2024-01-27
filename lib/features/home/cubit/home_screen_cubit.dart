import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  String selectedValue = "Daily";

  List<DropdownMenuItem<String>> dropMenuItems = const [
    DropdownMenuItem(
      value: 'Daily',
      child: Text('Trending Daily'),
    ),
    DropdownMenuItem(
      value: 'Weekly',
      child: Text('Trending Weekly'),
    ),
  ];

  void dropValue(String? value) {
    selectedValue = value!;
    emit(SelectedValueState());
  }
}
