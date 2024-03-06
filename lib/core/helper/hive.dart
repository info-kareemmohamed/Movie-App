import 'package:flutter_project/core/model/app_data.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/favourite/model/movie_favourite.dart';
import '../utils/Constants.dart';

class HiveHelper {
  static late Box FavouriteBox;
  static late Box AppBox;

  static Future<void> hiveFavouriteInatailzetion() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MovieFavouriteAdapter());
    FavouriteBox = await Hive.openBox<MovieFavourite>(FAVOURITE_DATA);
  }

  static Future<void> hiveAppInatailzetion() async {
    await Hive.initFlutter();
   // Hive.registerAdapter(AppDataAdapter());
    AppBox = await Hive.openBox<AppData>(APP_DATA);
  }

  static Future<void> hiveInatailzetion() async {
    await hiveAppInatailzetion();
    await hiveFavouriteInatailzetion();
  }
}
