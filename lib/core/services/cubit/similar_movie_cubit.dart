import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/cubit/similar_movie_state.dart';

import '../datasource/model/MovieDetailsResponse.dart';
import '../datasource/model/MovieSimilarResponse.dart';
import '../datasource/remote/api/ApiService.dart';
import 'info_movie_state.dart';

class SimilarMovieCubit extends Cubit<SimilarMovieStates> {
  List<MovieSimilar>? movies;

  SimilarMovieCubit() : super(SimilarMovieInitialState()) {}

  List<MovieSimilar>? getsimilarMovie(String Url) {
    try {
      ApiService.apiService.fetchMovie(Url).then((value) {
        if (value.containsKey('results')) {
          movies = List<Map<String, dynamic>>.from(value['results'])
              .map((json) => MovieSimilar().fromJson(json))
              .toList();
          emit(SimilarMovieSuccessState(movies!));
        }
      });
    } catch (e) {
      throw SimilarMovieErrorState('Failed to fetch movies: $e');
    }
    return this.movies;
  }
}
