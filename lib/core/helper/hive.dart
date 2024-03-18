import 'package:flutter_project/core/model/app_data.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/favourite/model/movie_favourite.dart';
import '../model/color_adapter.dart';
import '../utils/Constants.dart';

class HiveHelper {
  static late Box FavouriteBox;
  static late Box AppBox;
  static final String AppKey='App_Key';

  static Future<void> hiveFavouriteInatailzetion() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MovieFavouriteAdapter());
    FavouriteBox = await Hive.openBox<MovieFavourite>(FAVOURITE_DATA);
  }

  static Future<void> hiveAppInatailzetion() async {
    Hive.registerAdapter(ColorAdapter());
    await Hive.initFlutter();
    Hive.registerAdapter(AppDataAdapter());
    AppBox = await Hive.openBox<AppData>(APP_DATA);

    if (HiveHelper.AppBox.isEmpty) {
      HiveHelper.AppBox.put(AppKey, AppData.instance);
    }
  }

  static Future<void> hiveInatailzetion() async {
    await hiveAppInatailzetion();
    await hiveFavouriteInatailzetion();
  }
}
