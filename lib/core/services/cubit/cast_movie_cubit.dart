import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/datasource/model/MovieCast.dart';

import '../datasource/remote/api/ApiService.dart';
import 'cast_movie_state.dart';

class CastMovieCubit extends Cubit<CastMovieStates> {
  List<Cast>? casts;

  CastMovieCubit() : super(CastMovieInitialState()) {}

  List<Cast>? getCastMovie(String Url) {
    try {
      ApiService.apiService.fetchMovie(Url).then((value) {
        if (value.containsKey('cast')) {
          casts = List<Map<String, dynamic>>.from(value['cast'])
              .map((json) => Cast().fromJson(json))
              .toList();
          emit(CastMovieSuccessState(casts!));
        }
      });
    } catch (e) {
      throw CastMovieErrorState('Failed to fetch movies: $e');
    }
    return casts;
  }
}
