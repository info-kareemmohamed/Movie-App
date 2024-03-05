import 'package:flutter/material.dart';
import 'package:flutter_project/core/services/datasource/remote/apiLinks/AllApi.dart';
import 'package:flutter_project/features/movie_details/model/MovieSimilarResponse.dart';
import 'package:flutter_project/features/movie_details/screens/details_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/navigation.dart';
import '../../../../core/utils/app_routes.dart';

class ShowMoreFilms extends StatelessWidget {
  ShowMoreFilms({super.key, required this.movieSimilar});

  List<MovieSimilar> movieSimilar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0.h),
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          movieSimilar.length,
          (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: GestureDetector(
                onTap: () => NavigationHelper.navigateTo(
                    AppRoute.MOVIE_DETAILS,
                    arguments: movieSimilar[index].id),
                child: Container(
                  margin:  EdgeInsets.symmetric(horizontal: 28.h),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        '$imageBaseUrl${movieSimilar[index].posterPath}',
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(10.w),
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
