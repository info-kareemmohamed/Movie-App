import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/movie_details/cubit/similar/similar_movie_state.dart';

import '../../model/MovieSimilarResponse.dart';
import '../../../../core/services/datasource/remote/api/ApiService.dart';

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
