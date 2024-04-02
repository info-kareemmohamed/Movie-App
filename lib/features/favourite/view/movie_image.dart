import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/services/datasource/remote/apiLinks/AllApi.dart';

class FavouriteMovieImage extends StatelessWidget {
  FavouriteMovieImage({super.key, required this.backdropPath});
  String backdropPath;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50.r,
      backgroundImage: CachedNetworkImageProvider(
        '${ApiUrl.instance.imageBaseUrl}$backdropPath',
      ),
    );
  }
}
