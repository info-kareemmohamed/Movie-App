import 'package:flutter/material.dart';
import 'package:flutter_project/features/login/screens/pages/login.dart';

import '../../features/app_layout/screens/app_layout_screen.dart';
import '../../features/favourite/view/favourite_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/register/view/register.dart';
import '../../features/movie_details/screens/details_screen.dart';
import '../../features/onboarding/screens/widgets/first_onboarding_screen.dart';
import '../../features/settings/settings_screen.dart';
import '../../main.dart';
import '../utils/app_routes.dart';

class NavigationHelper {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> navigateToReplacement(String routeName,
      {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  static void goBack() {
    return navigatorKey.currentState?.pop();
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.HOME:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoute.MOVIE_DETAILS:
        return MaterialPageRoute(builder: (_) {
          return MovieDetailsScreen(
            id: settings.arguments,
          );
        });
      case AppRoute.FAVOURITE:
        return MaterialPageRoute(builder: (_) => const FavouriteScreen());
      case AppRoute.SETTINGS:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case AppRoute.SIGN_UP:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case AppRoute.LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoute.APP_LAYOUT:
        return MaterialPageRoute(builder: (_) => const AppLayoutScreen());
      case AppRoute.FIRST_ON_BOARDING:
        return MaterialPageRoute(builder: (_) => const FirstOnBoardingScreen());
      default:
        return MaterialPageRoute(builder: (_) => const MyApp());
    }
  }
}
