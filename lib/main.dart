import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_project/core/helper/firebase.dart';
import 'package:flutter_project/core/helper/hive.dart';
import 'package:flutter_project/core/helper/navigation.dart';
import 'package:flutter_project/core/helper/provider.dart';
import 'package:flutter_project/core/model/app_data.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_routes.dart';
import 'package:flutter_project/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/theme/theme.dart';

void main() async {
  await FirebaseHelper.firebaseInitialization();
  await ScreenUtil.ensureScreenSize();
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
  static void setMode(BuildContext context, ThemeData mode) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setMode(mode);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale = Locale(AppData.instance.Language);
  ValueNotifier<ThemeData> _notifier = ValueNotifier(AppTheme.setTheme());

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  setMode(ThemeData mode) {
    setState(() {
      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      _notifier=ValueNotifier(mode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppProviders.providers],
      child:
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

          ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        ensureScreenSize: true,
        builder: (_, child) {
          return ValueListenableBuilder<ThemeData>(
              valueListenable: _notifier,
              builder: (context, mode, _) {
                return MaterialApp(
                  theme: mode,
                  locale: _locale,
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
              });
        },
      ),
    );
  }
}
