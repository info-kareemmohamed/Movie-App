
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/login/cubit/LoginCubit.dart';
import '../../features/movie_details/cubit/movie_details_cubit.dart';
import '../../features/onboarding/cubit/onboarding_cubit.dart';
import '../../features/register/cubit/register_cubit.dart';


abstract class AppProviders {
  static List<dynamic> providers = [
    BlocProvider(create: (context) => OnboardingCubit()),
    BlocProvider(create: (context) => LoginCubit()),
    BlocProvider(create: (context) => RegisterCubit()),

    BlocProvider(create: (context) => MovieDetailsCubit()),

  ];
}
