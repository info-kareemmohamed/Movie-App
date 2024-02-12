import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/core/services/datasource/model/MovieResponse.dart';
import 'package:flutter_project/core/services/datasource/remote/api/ApiService.dart';
part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());
  late List<MovieResponse> movies;
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

  // List<MovieResponse> getMovies(String Url) {
  //   try {
  //     ApiService.apiService.fetchMovie(Url).then((value) {
  //       if (value.containsKey('results')) {
  //         movies = List<Map<String, dynamic>>.from(value['results'])
  //             .map((json) => MovieResponse().fromJson(json))
  //             .toList();
  //       }
  //
  //     });
  //   } catch (e) {
  //     throw ErrorState('Failed to fetch movies: $e');
  //   }
  //   return movies;
  // }


  // Future<List<MovieResponse>> getTopRatedMovies(String Url) {
  //       movies= getMovies(Url);
  //       emit(TopRatedSuccessState(movies));
  //   return Future.value(movies);
  // }
  //
  // Future<List<MovieResponse>> getTrendingDayMovies(String Url) {
  //   movies= getMovies(Url);
  //   emit(TrendingDayMoviesSuccessState(movies));
  //   return Future.value(movies);
  // }
  //
  // Future<List<MovieResponse>> getTrendingWeekMovies(String Url) {
  //   movies= getMovies(Url);
  //   emit(TrendingWeekMoviesSuccessState(movies));
  //   return Future.value(movies);
  // }








}
