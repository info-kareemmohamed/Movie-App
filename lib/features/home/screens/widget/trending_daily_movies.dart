import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/home/cubit/trendingDay/trending_day_movies_cubit.dart';
import 'package:flutter_project/features/home/common/screen_common_widget.dart';
import '../../../../core/common/app_widget.dart';

class TrendingDailyScreen extends StatelessWidget {
  const TrendingDailyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingDayMoviesCubit, TrendingDayMoviesStates>(
      builder: (context, state) {
        if (state is TrendingDayMoviesSuccessState) {
          return ScreenCommonWidget.SingleChildScrollViewMovies(state.movies, 10,20);
        } else if (state is TrendingDayMoviesInitialState) {
          return const Center(child: CircularProgressIndicator());
        }
        else if(state is TrendingDayMoviesErrorState){
       return  AppWidget.buildErrorScreen(state.message??"Sorry Not Found");
        }
        else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
