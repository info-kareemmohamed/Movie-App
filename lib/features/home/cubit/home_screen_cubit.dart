import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());

  String? selectedValue;

  List<DropdownMenuItem<String>> dropMenuItems = const [
    DropdownMenuItem(
      value: 'Trending Now',
      child: Text('Trending Now'),
    ),
    DropdownMenuItem(
      value: 'Daily',
      child: Text('Daily'),
    ),
  ];

  void dropValue(String? value) {
    selectedValue = value;

    emit(SelectedValueState());
  }
}
