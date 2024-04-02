import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/common/widget/app_widget.dart';
import 'package:flutter_project/core/services/datasource/remote/apiLinks/AllApi.dart';
import 'package:flutter_project/features/home/common/screen_common_widget.dart';
import 'package:flutter_project/features/home/cubit/topRated/top_rated_movies_cubit.dart';

class LatestMovies extends StatelessWidget {
  const LatestMovies({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) =>
          TopRatedMoviesCubit()..getTopRatedMovies(ApiUrl.instance.topRatedMovieUrl),
      child: BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
        builder: (context, state) {
          if (state is TopRatedInitialState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TopRatedSuccessState) {
            return ScreenCommonWidget.SingleChildScrollViewMovies(
                state.movies, 5, 5);
          } else if (state is TopRatedErrorState) {
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
