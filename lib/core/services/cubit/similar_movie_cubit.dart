import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/cubit/similar_movie_state.dart';

import '../datasource/model/MovieDetailsResponse.dart';
import '../datasource/model/MovieSimilarResponse.dart';
import '../datasource/remote/api/ApiService.dart';
import 'info_movie_state.dart';

class SimilarMovieCubit extends Cubit<SimilarMovieStates> {
  MovieListSimilar? movie;
  SimilarMovieCubit() : super(SimilarMovieInitialState()) {}

  MovieListSimilar? getsimilarMovie(String Url) {
    try {
      ApiService.apiService.fetchMovieMovieSimilar(Url).then((value) {
        movie =value;
        print('${movie} wwwwwwwwwwwwwwwwwwwwaaaaaaaaaaaa');
        emit(SimilarMovieSuccessState(movie!));
      });
    } catch (e) {
      print(e.toString());
      throw SimilarMovieErrorState('Failed to fetch movies: $e');
    }
    return this.movie;
  }
}
