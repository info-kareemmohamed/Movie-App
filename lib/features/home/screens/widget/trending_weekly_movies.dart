import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/common/widget/app_widget.dart';
import 'package:flutter_project/core/services/datasource/remote/apiLinks/AllApi.dart';
import 'package:flutter_project/features/home/common/screen_common_widget.dart';
import 'package:flutter_project/features/home/cubit/trendingWeek/trending_week_movie_cubit.dart';
import 'package:flutter_project/features/home/cubit/trendingWeek/trending_week_movie_state.dart';

class TrendingWeeklyScreen extends StatelessWidget {
  const TrendingWeeklyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TrendingWeekMoviesCubit()..getTrendingWeekWeek(ApiUrl.instance.trendingWeekUrl),
      child: BlocBuilder<TrendingWeekMoviesCubit, TrendingWeekMoviesStates>(
        builder: (context, state) {
          if (state is TrendingWeekMoviesSuccessState) {
            return ScreenCommonWidget.SingleChildScrollViewMovies(
                state.movies, 10, 20);
          } else if (state is TrendingWeekMoviesInitialState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TrendingWeekMoviesErrorState) {
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
