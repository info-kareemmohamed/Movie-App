import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/cubit/moviecubit.dart';
import 'package:flutter_project/core/services/datasource/remote/apiLinks/AllApi.dart';
import 'package:flutter_project/features/app_layout/cubit/app_layout_cubit.dart';
import 'package:flutter_project/features/home/cubit/home_screen_cubit.dart';
import 'package:flutter_project/features/home/screens/home_screen.dart';
import 'package:flutter_project/features/login/cubit/LoginCubit/LoginCubit.dart';
import 'package:flutter_project/features/login/cubit/SignUpCubit/sign_up_cubit.dart';
import 'package:flutter_project/features/movie_details/cubit/movie_details_cubit.dart';
import 'package:flutter_project/features/onboarding/screens/widgets/first_onboarding_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

// import 'package:flutter_project/features/onboarding/cubit/onboarding_cubitutter_project/features/onboarding/screens/widgets/first_onboarding_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Open Hive box
 Box box= await Hive.openBox('login');
 box.putAt(0, true);
 print(box.getAt(0));
 box.putAt(0, false);
 print(box.getAt(0));


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => OnboardingCubit()),
        BlocProvider(create: (context) => HomeScreenCubit()),
        BlocProvider(create: (context) => MovieDetailsCubit()),
        BlocProvider(
            create: (context) => MoviesCubit()
              ..getPopular(popularmovieurl)
              ..getAllMovies(trendingdayurl)
              ..getT(popularmovieurl)),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => AppLayoutCubit()),
      ],
      child:   MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hulu',
        home:  FirebaseAuth.instance.currentUser?.uid != null ?const HomeScreen():const FirstOnBoardingScreen(),
      ),
    );
  }
}
