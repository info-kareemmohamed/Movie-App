import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';

import '../../../core/helper/navigation.dart';
import '../../../core/utils/app_routes.dart';
import '../../../generated/l10n.dart';

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
            height: 190,
            width: 135,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                CachedNetworkImageProvider('https://image.tmdb.org/t/p/w500${imageLink}'),
                fit: BoxFit.cover, // Adjust the fit as per your requirement
              ),
              borderRadius: BorderRadius.circular(10),
            ),


            margin: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 15,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (title?.length ?? 1) > 20
                      ? '${title!.substring(0, 20)} ...'
                      : title ?? "Not Found",
                  style: AppTextStyle.light(
                    fontSize: 10,
                  ),
                ),
                Text(
                  releaseDate ?? "Not Found",
                  style: AppTextStyle.light(
                    fontSize: 10,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    print('Save ');
                  },
                  child: Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.lightYellow,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.bookmark_border_rounded,
                            size: 15,
                            color: AppColors.lightYellow,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            S.of(context).home_watch_it,
                            style: AppTextStyle.black(
                              color: AppColors.lightYellow,
                              fontSize: 7,
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
