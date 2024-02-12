import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/common/app_widget.dart';
import 'package:flutter_project/core/services/cubit/top_rated_movies_cubit.dart';
import 'package:flutter_project/features/home/common/screen_common_widget.dart';
import 'package:flutter_project/features/home/common/movie_card.dart';

class LatestMovies extends StatelessWidget {
  const LatestMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
      builder: (context, state) {
        if (state is TopRatedInitialState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TopRatedSuccessState) {
          return ScreenCommonWidget.SingleChildScrollViewMovies(state.movies, 5,5);
        } else if (state is TopRatedErrorState) {
          return AppWidget.buildErrorScreen(state.message ?? "Sorry Not Found");
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
