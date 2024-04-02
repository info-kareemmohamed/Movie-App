import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/datasource/remote/apiLinks/AllApi.dart';
import 'package:flutter_project/features/home/common/screen_common_widget.dart';
import 'package:flutter_project/features/home/cubit/trendingDay/trending_day_movies_cubit.dart';

import '../../../../core/common/widget/app_widget.dart';

class TrendingDailyScreen extends StatelessWidget {
  const TrendingDailyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TrendingDayMoviesCubit()..getTrendingDayMovies(ApiUrl.instance.trendingDayUrl),
      child: BlocBuilder<TrendingDayMoviesCubit, TrendingDayMoviesStates>(
        builder: (context, state) {
          if (state is TrendingDayMoviesSuccessState) {
            return ScreenCommonWidget.SingleChildScrollViewMovies(
                state.movies, 10, 20);
          } else if (state is TrendingDayMoviesInitialState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TrendingDayMoviesErrorState) {
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
