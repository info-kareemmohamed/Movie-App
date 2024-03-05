import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/common/app_widget.dart';
import 'package:flutter_project/core/services/datasource/remote/apiLinks/AllApi.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/features/movie_details/cubit/movie_details_cubit.dart';
import 'package:flutter_project/features/movie_details/cubit/similar/similar_movie_cubit.dart';
import 'package:flutter_project/features/movie_details/cubit/similar/similar_movie_state.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/button_less_movies.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/show_less_movies.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/show_more_movies.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreLikeThisMovie extends StatelessWidget {
  MoreLikeThisMovie({Key? key, required this.movieId}) : super(key: key);
  dynamic movieId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieDetailsCubit>(
          create: (context) => MovieDetailsCubit(),
        ),
        BlocProvider<SimilarMovieCubit>(
          create: (context) => SimilarMovieCubit()
            ..getSimilarMovie(getEndPoint2("similar", movieId)),
        ),
      ],
      child: BlocBuilder<SimilarMovieCubit, SimilarMovieStates>(
        builder: (context, state) {
          if (state is SimilarMovieSuccessState) {
            return Stack(
              children: [
                Visibility(
                  visible: !context.watch<MovieDetailsCubit>().allMovies,
                  child: ShowLessMovies(movieSimilar: state.movie),
                ),
                Positioned(
                  top: 25.h,
                  right: -90.w,
                  child: Image.asset(
                    AppImages.shadowMoreFilms,
                  ),
                ),
                context.watch<MovieDetailsCubit>().allMovies
                    ? ShowMoreFilms(movieSimilar: state.movie)
                    : const ButtonLessMovies(),
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
