import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/core/services/datasource/remote/apiLinks/AllApi.dart';
import 'package:flutter_project/core/utils/app_routes.dart';
import 'package:flutter_project/features/movie_details/model/MovieSimilarResponse.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/navigation.dart';

class ShowLessMovies extends StatelessWidget {
  ShowLessMovies({super.key, required this.movieSimilar});

  List<MovieSimilar> movieSimilar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          4,
          (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: GestureDetector(
                onTap: () => NavigationHelper.navigateTo(AppRoute.MOVIE_DETAILS,
                    arguments: movieSimilar[index].id),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 28.w),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        '$imageBaseUrl${movieSimilar[index].posterPath}',
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
