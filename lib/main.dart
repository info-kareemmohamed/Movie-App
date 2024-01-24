import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/datasource/model/MovieResponse.dart';
import 'package:flutter_project/core/services/datasource/remote/api/ApiService.dart';
import 'package:flutter_project/features/home/cubit/home_screen_cubit.dart';
import 'package:flutter_project/features/movie_details/cubit/movie_details_cubit.dart';
import 'package:flutter_project/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:flutter_project/features/onboarding/screens/widgets/first_onboarding_screen.dart';

import 'core/services/datasource/remote/apiLinks/AllApi.dart';

void main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
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
        BlocProvider(create: (context) => MovieDetailsCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hulu',
        home: FirstOnBoardingScreen(),
      ),
    );
  }
}
