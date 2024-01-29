

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/cubit/video_movie_state.dart';

import '../../../features/movie_details/data/models/video_movie.dart';
import '../datasource/remote/api/ApiService.dart';

class VideoMovieCubit extends Cubit<VideoMoviesStates> {
  MovieDetail? movie;
  VideoMovieCubit() : super(VideoMoviesInitialState()) {}

  MovieDetail? getvideoMovie(String Url) {
    try {
      ApiService.apiService.fetchVideoMovie(Url).then((value) {
        movie = value;
        print('${movie}');
        emit(VideoMoviesSuccessState(movie!));
      });
    } catch (e) {
      print(e.toString());
      throw VideoMoviesErrorState('Failed to fetch movies: $e');
    }
    return movie;
  }
}
