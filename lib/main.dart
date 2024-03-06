import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/helper/firebase.dart';
import 'package:flutter_project/core/helper/hive.dart';
import 'package:flutter_project/core/helper/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/helper/navigation.dart';
import 'core/model/main_user.dart';
import 'core/utils/Constants.dart';
import 'core/utils/app_routes.dart';


void main() async {
  await FirebaseHelper.firebaseInitialization();
  await HiveHelper.hiveInatailzetion();
  await FirebaseHelper.setUserMain();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ...AppProviders.providers
      ],

      child:
      // ScreenUtilInit(
      //     designSize: const Size(375, 812),
      //     minTextAdapt: true,
      //     splitScreenMode: true,
      //     builder: (_, child) {
             MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Hulu',
              navigatorKey: NavigationHelper.navigatorKey,
              onGenerateRoute: NavigationHelper.generateRoute,
              initialRoute: UserMain.instance != null
                  ? AppRoute.SETTINGS
                  : AppRoute.SETTINGS,

            ),
          //}),
    );
  }
}
