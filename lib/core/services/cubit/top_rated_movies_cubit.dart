import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/datasource/model/MovieResponse.dart';
import 'package:flutter_project/core/services/datasource/remote/api/ApiService.dart';
import 'package:meta/meta.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  late List<Results> movies;
  TopRatedMoviesCubit() : super(TopRatedInitialState()) {
    movies = [];
  }

  Future<List<Results>> getTopRatedMovies(String Url) {
    try {
      ApiService.apiService.fetchMovie(Url).then((value) {
        movies = value.results ?? [];
        emit(TopRatedSuccessState(movies));
      });
    } catch (e) {
      throw TopRatedErrorState('Failed to fetch movies: $e');
    }
    return Future.value(movies);
  }
}
