

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/datasource/model/MovieCast.dart';

import '../datasource/remote/api/ApiService.dart';
import 'cast_movie_state.dart';

class CastMovieCubit extends Cubit<CastMovieStates> {
   List<Cast>? casts;
  CastMovieCubit() : super(CastMovieInitialState()) {}

  List<Cast>? getCastMovie(String Url) {
    try {
      ApiService.apiService.fetchCastMovie(Url).then((value) {
        casts = value;
        print('${casts}');
        emit(CastMovieSuccessState(casts!));
      });
    } catch (e) {
      print(e.toString());
      throw CastMovieErrorState('Failed to fetch movies: $e');
    }
    return casts;
  }
}
