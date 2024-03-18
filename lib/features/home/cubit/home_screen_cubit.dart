import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/home/model/MovieResponse.dart';
import 'package:flutter_project/core/services/datasource/remote/api/ApiService.dart';

import '../../../core/model/app_data.dart';
import '../../../core/utils/Constants.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());
  late List<MovieResponse> movies;
  String selectedValue = "Daily";

  List<DropdownMenuItem<String>> dropMenuItems = [
    DropdownMenuItem(
      value: 'Daily',
      child: Text(AppData.instance.Language == ENGLISH
          ? 'Trending Daily'
          : "الاتجاه اليومي"),
    ),
    DropdownMenuItem(
      value: 'Weekly',
      child: Text(AppData.instance.Language == ENGLISH
          ? 'Trending Weekly'
          : "الاتجاه الأسبوعي"),
    ),
  ];

  void dropValue(String? value) {
    selectedValue = value!;
    emit(SelectedValueState());
  }
}
