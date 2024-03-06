import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/app_layout/cubit/app_layout_cubit.dart';

import '../../features/favourite/cubit/FavouriteMovieCubit.dart';
import '../../features/home/cubit/home_screen_cubit.dart';
import '../../features/home/cubit/topRated/top_rated_movies_cubit.dart';
import '../../features/home/cubit/trendingDay/trending_day_movies_cubit.dart';
import '../../features/home/cubit/trendingWeek/trending_week_movie_cubit.dart';
import '../../features/login/cubit/LoginCubit.dart';
import '../../features/movie_details/cubit/movie_details_cubit.dart';
import '../../features/onboarding/cubit/onboarding_cubit.dart';
import '../../features/register/cubit/register_cubit.dart';
import '../services/datasource/remote/apiLinks/AllApi.dart';

abstract class AppProviders {
  static List<dynamic> providers = [
    BlocProvider(create: (context) => OnboardingCubit()),
    BlocProvider(create: (context) => HomeScreenCubit()),
    BlocProvider(create: (context) => LoginCubit()),
    BlocProvider(create: (context) => RegisterCubit()),
    BlocProvider(create: (context) => AppLayoutCubit()),
    BlocProvider(
        create: (context) =>
            TrendingDayMoviesCubit()..getTrendingDayMovies(trendingDayUrl)),
    BlocProvider(create: (context) => MovieDetailsCubit()),
    BlocProvider(
        create: (context) =>
            TrendingWeekMoviesCubit()..getTrendingWeekWeek(trendingWeekUrl)),
    BlocProvider(
        create: (context) =>
            TopRatedMoviesCubit()..getTopRatedMovies(topRatedMovieUrl)),
    BlocProvider(create: (context) => FavouriteMovieCubit()),
  ];
}
