import 'package:flutter/material.dart';
import 'package:flutter_project/core/services/datasource/remote/apiLinks/AllApi.dart';
import 'package:flutter_project/features/movie_details/model/MovieSimilarResponse.dart';
import 'package:flutter_project/features/movie_details/screens/details_screen.dart';

class ShowLessMovies extends StatelessWidget {
  ShowLessMovies({super.key, required this.movieSimilar});

  List<MovieSimilar> movieSimilar;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          4,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MovieDetails(
                              id: movieSimilar[index].id,
                            ))),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 28),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        '$imageBaseUrl${movieSimilar[index].posterPath}',
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
