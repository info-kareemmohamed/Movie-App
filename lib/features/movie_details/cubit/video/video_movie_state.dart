
import '../../model/video_movie.dart';

abstract class VideoMoviesStates {}

class VideoMoviesInitialState extends VideoMoviesStates {}

class VideoMoviesErrorState extends VideoMoviesStates {
  String? message;
  VideoMoviesErrorState(this.message);
}

class VideoMoviesSuccessState extends VideoMoviesStates {
  final List<MovieDetail> movies;
  VideoMoviesSuccessState(this.movies);
}
