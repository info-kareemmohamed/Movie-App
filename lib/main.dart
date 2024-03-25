import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_project/core/helper/firebase.dart';
import 'package:flutter_project/core/helper/hive.dart';
import 'package:flutter_project/core/helper/provider.dart';
import 'package:flutter_project/core/model/app_data.dart';
import 'package:flutter_project/generated/l10n.dart';
import 'core/helper/navigation.dart';
import 'core/model/main_user.dart';
import 'core/utils/app_routes.dart';

void main() async {
  await FirebaseHelper.firebaseInitialization();
  await HiveHelper.hiveInatailzetion();
  await FirebaseHelper.setUserMain();
  await FirebaseHelper.Notifications();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newlocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newlocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale = Locale(AppData.instance.Language);

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppProviders.providers],

      child:
          // ScreenUtilInit(
          //     designSize: const Size(375, 812),
          //     minTextAdapt: true,
          //     splitScreenMode: true,
          //     builder: (_, child) {
          MaterialApp(
        locale: _locale,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        title: 'Hulu',
        navigatorKey: NavigationHelper.navigatorKey,
        onGenerateRoute: NavigationHelper.generateRoute,
        initialRoute:
            UserMain.instance != null ? AppRoute.APP_LAYOUT : AppRoute.LOGIN,
      ),
      //}),
    );
  }
}
