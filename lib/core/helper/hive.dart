import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/favourite/model/movie_favourite.dart';
import '../utils/Constants.dart';

Future<void> hiveFavouriteInatailzetion() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MovieFavouriteAdapter());
  box = await Hive.openBox<MovieFavourite>(FAVOURITE_DATA);
}