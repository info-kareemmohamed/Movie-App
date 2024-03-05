import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/movie_details/screens/details_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/navigation.dart';
import '../../../core/utils/app_routes.dart';

class MovieCard extends StatelessWidget {
  MovieCard({
    super.key,
    required this.imageLink,
    required this.title,
    required this.releaseDate,
    required this.movieId,
  });

  String? imageLink;
  String? title;
  String? releaseDate;
  String? movieId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationHelper.navigateTo(AppRoute.MOVIE_DETAILS, arguments: movieId);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 190.h,
            width: 135.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    NetworkImage('https://image.tmdb.org/t/p/w500${imageLink}'),
                fit: BoxFit.cover, // Adjust the fit as per your requirement
              ),
              borderRadius: BorderRadius.circular(10.w),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 20.0.w,
              vertical: 15.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (title?.length ?? 1) > 20
                      ? '${title!.substring(0, 20)} ...'
                      : title ?? "Not Found",
                  style: AppTextStyle.light(
                    color: AppColors.lightYellow,
                    fontSize: 10.sp,
                  ),
                ),
                Text(
                  releaseDate ?? "Not Found",
                  style: AppTextStyle.light(
                    color: AppColors.lightRed,
                    fontSize: 10.sp,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                GestureDetector(
                  onTap: () {
                    print('Save ');
                  },
                  child: Container(
                    height: 30.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      border: Border.all(
                        color: AppColors.lightYellow,
                        width: 2.w,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.bookmark_border_rounded,
                            size: 15.w,
                            color: AppColors.lightYellow,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            'Add Watchlist',
                            style: AppTextStyle.black(
                              color: AppColors.lightYellow,
                              fontSize: 7.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
