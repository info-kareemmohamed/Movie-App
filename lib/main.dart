import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/home/cubit/home_screen_cubit.dart';
import 'package:flutter_project/features/login/cubit/SocialLoginCubit.dart';
import 'package:flutter_project/features/movie_details/cubit/movie_details_cubit.dart';
import 'package:flutter_project/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:flutter_project/features/onboarding/screens/widgets/first_onboarding_screen.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // try {
  //   UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //     email: 'ppppp@wwww.com',
  //     password: 'password',
  //   );
  //   // Handle successful user creation
  // } catch (e) {
  //   print('Error creating user: $e');
  // }
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
        BlocProvider(create: (context) => SocialLoginCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hulu',
        home: FirstOnBoardingScreen(),
      ),
    );
  }
}
