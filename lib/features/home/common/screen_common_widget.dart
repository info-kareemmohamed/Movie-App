import 'package:flutter/cupertino.dart';

import '../model/MovieResponse.dart';
import 'movie_card.dart';

class ScreenCommonWidget{

  static Widget listMovies(List<MovieResponse> movies){
  return  Row(
      children: List.generate(
        movies.length,
            (index) => MovieCard(
          imageLink: movies[index].backdropPath??"",
          title: movies[index].title??"",
          movieId: movies[index].id.toString()??"",
          releaseDate: movies[index].releaseDate??"",
        ),
      ),
    );
  }


  static Widget SingleChildScrollViewMovies(List<MovieResponse> movies, double h ,double v){
    return
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal:h,
            vertical: v,
          ),
          child:ScreenCommonWidget.listMovies(movies),
        ),
      );
  }


}