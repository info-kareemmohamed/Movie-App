import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/app_layout/cubit/app_layout_cubit.dart';
import 'package:flutter_project/features/settings/cubit/settings_cubit.dart';

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
    BlocProvider(create: (context) => LoginCubit()),
    BlocProvider(create: (context) => RegisterCubit()),

    BlocProvider(create: (context) => MovieDetailsCubit()),

  ];
}
