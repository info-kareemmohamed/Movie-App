import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_project/core/helper/firebase.dart';
import 'package:flutter_project/core/helper/hive.dart';
import 'package:flutter_project/core/helper/navigation.dart';
import 'package:flutter_project/core/helper/provider.dart';
import 'package:flutter_project/core/utils/app_routes.dart';
import 'package:flutter_project/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'app/theme/theme.dart';

void main() async {
  await FirebaseHelper.firebaseInitialization();
  await ScreenUtil.ensureScreenSize();
  await HiveHelper.hiveInatailzetion();
  await FirebaseHelper.setUserMain();
  await FirebaseHelper.Notifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //   providers: [...AppProviders.providers],
    //   child:
    // MaterialApp(
    //   locale: _locale,
    //   localizationsDelegates: const [
    //     S.delegate,
    //     GlobalMaterialLocalizations.delegate,
    //     GlobalWidgetsLocalizations.delegate,
    //     GlobalCupertinoLocalizations.delegate,
    //   ],
    //   supportedLocales: S.delegate.supportedLocales,
    //   debugShowCheckedModeBanner: false,
    //   title: 'HULU',
    //   navigatorKey: NavigationHelper.navigatorKey,
    //   onGenerateRoute: NavigationHelper.generateRoute,
    //   initialRoute: AppRoute.LOGIN,
    // ),

    return MultiBlocProvider(
      providers: [...AppProviders.providers],
      // assuming AppProviders.providers is your list of bloc providers
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        ensureScreenSize: true,
        builder: (_, child) {
          return ChangeNotifierProvider(
            create: (context) => AppTheme(), // Create an instance of AppTheme
            child: Consumer<AppTheme>(
              builder: (_, appTheme, __) {
                return MaterialApp(
                  // Set theme using the appTheme instance
                  theme: appTheme.themeData,
                  // Other MaterialApp properties
                  locale: appTheme.locale,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  debugShowCheckedModeBanner: false,
                  title: 'HULU',
                  navigatorKey: NavigationHelper.navigatorKey,
                  onGenerateRoute: NavigationHelper.generateRoute,
                  initialRoute: AppRoute.SPLASH,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
