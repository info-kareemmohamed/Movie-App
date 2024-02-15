import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/movie_details/cubit/video/video_movie_state.dart';

import '../../model/video_movie.dart';
import '../../../../core/services/datasource/remote/api/ApiService.dart';

class VideoMovieCubit extends Cubit<VideoMoviesStates> {
 List<MovieDetail>? movies;

  VideoMovieCubit() : super(VideoMoviesInitialState()) {}

  List<MovieDetail>? getvideoMovie(String Url) {
    try {
      ApiService.apiService.fetchMovie(Url).then((value) {
        if (value.containsKey('results')) {
          movies = List<Map<String, dynamic>>.from(value['results'])
              .map((json) => MovieDetail().fromJson(json))
              .toList();
          emit(VideoMoviesSuccessState(movies!));
        }

      });
    } catch (e) {

      throw VideoMoviesErrorState('Failed to fetch movies: $e');
    }
    return movies;
  }
}
