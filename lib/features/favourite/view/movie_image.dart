import 'package:flutter/material.dart';

import '../../../core/services/datasource/remote/apiLinks/AllApi.dart';

class FavouriteMovieImage extends StatelessWidget {
  FavouriteMovieImage({super.key,required this.backdropPath});
 String backdropPath;
  @override
  Widget build(BuildContext context) {
    return    CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage(
          '$imageBaseUrl$backdropPath'),
    );
  }
}
