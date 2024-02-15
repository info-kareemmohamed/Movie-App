import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/helper/firebase.dart';
import 'package:flutter_project/core/helper/hive.dart';
import 'package:flutter_project/features/home/cubit/topRated/top_rated_movies_cubit.dart';
import 'package:flutter_project/features/home/cubit/trendingDay/trending_day_movies_cubit.dart';
import 'package:flutter_project/features/home/cubit/trendingWeek/trending_week_movie_cubit.dart';
import 'package:flutter_project/core/services/datasource/remote/apiLinks/AllApi.dart';
import 'package:flutter_project/features/app_layout/cubit/app_layout_cubit.dart';
import 'package:flutter_project/features/app_layout/screens/app_layout_screen.dart';
import 'package:flutter_project/features/home/cubit/home_screen_cubit.dart';
import 'package:flutter_project/features/login/cubit/LoginCubit/LoginCubit.dart';
import 'package:flutter_project/features/login/cubit/SignUpCubit/sign_up_cubit.dart';
import 'package:flutter_project/features/movie_details/cubit/movie_details_cubit.dart';
import 'package:flutter_project/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:flutter_project/features/onboarding/screens/widgets/first_onboarding_screen.dart';
import 'features/favourite/cubit/FavouriteMovieCubit.dart';


void main() async {
 await firebaseInitialization();
 await  hiveFavouriteInatailzetion();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnboardingCubit()),
        BlocProvider(create: (context) => HomeScreenCubit()),
        BlocProvider(
            create: (context) =>
                TrendingDayMoviesCubit()..getTrendingDayMovies(trendingDayUrl)),
        BlocProvider(create: (context) => MovieDetailsCubit()),
        BlocProvider(
            create: (context) => TrendingWeekMoviesCubit()
              ..getTrendingWeekWeek(trendingWeekUrl)),
        BlocProvider(
            create: (context) =>
                TopRatedMoviesCubit()..getTopRatedMovies(topRatedMovieUrl)),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => AppLayoutCubit()),
        BlocProvider(create: (context) => FavouriteMovieCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hulu',
        home: FirebaseAuth.instance.currentUser?.uid != null
            ? const AppLayoutScreen()
            : const FirstOnBoardingScreen(),
      ),
    );
  }
}
