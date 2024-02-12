import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/common/app_widget.dart';
import 'package:flutter_project/core/services/cubit/similar_movie_cubit.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/features/movie_details/cubit/movie_details_cubit.dart';
import 'package:flutter_project/features/movie_details/screens/details_screen.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/show_less_movies.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/show_more_movies.dart';

import '../../../../core/services/cubit/info_movie_cubit.dart';
import '../../../../core/services/cubit/info_movie_state.dart';
import '../../../../core/services/cubit/similar_movie_state.dart';
import '../../../../core/services/datasource/remote/apiLinks/AllApi.dart';
import '../../../../core/utils/app_text_style.dart';

class MoreLikeThisMovie extends StatelessWidget {
  MoreLikeThisMovie({Key? key, required this.movieId}) : super(key: key);
  dynamic movieId;
  int lastShow = 5;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MovieDetailsCubit>();

    return BlocProvider(
      create: (context) => SimilarMovieCubit()
        ..getsimilarMovie(getEndPoint2("similar", movieId)),
      child: BlocBuilder<SimilarMovieCubit, SimilarMovieStates>(
        builder: (context, state) {
          if (state is SimilarMovieSuccessState) {
            return Stack(
              children: [
                Visibility(
                  visible: !cubit.allMovies,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: List.generate(
                          state.movie.length - lastShow,
                          (rowIndex) => Row(children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MovieDetails(
                                          id: state.movie[rowIndex].id))),
                              child: Container(
                                height: 200,
                                width: 133,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${imageBaseUrl}${state.movie[rowIndex].posterPath}'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 15,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MovieDetails(
                                          id: state
                                              .movie[rowIndex + lastShow].id))),
                              child: Container(
                                height: 200,
                                width: 133,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${imageBaseUrl}${state.movie[rowIndex + lastShow].posterPath}'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 15,
                                ),
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is SimilarMovieInitialState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SimilarMovieErrorState) {
            return AppWidget.buildErrorScreen(
                state.message ?? "Sorry Not Found");
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
