
import '../../../features/movie_details/data/models/video_movie.dart';

abstract class VideoMoviesStates {}

class VideoMoviesInitialState extends VideoMoviesStates {}

class VideoMoviesErrorState extends VideoMoviesStates {
  String? message;
  VideoMoviesErrorState(this.message);
}

class VideoMoviesSuccessState extends VideoMoviesStates {
  final MovieDetail movies;
  VideoMoviesSuccessState(this.movies);
}
