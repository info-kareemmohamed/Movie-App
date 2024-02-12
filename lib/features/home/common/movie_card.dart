import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/movie_details/screens/details_screen.dart';

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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetails(id:movieId)));
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
                    NetworkImage('https://image.tmdb.org/t/p/w500${imageLink}'),
                fit: BoxFit.cover, // Adjust the fit as per your requirement
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (title?.length ?? 1) > 20
                      ? '${title!.substring(0, 20)} ...'
                      : title ?? "Not Found",
                  style: AppTextStyle.light(
                    color: AppColors.lightYellow,
                    fontSize: 10,
                  ),
                ),
                Text(
                  releaseDate ?? "Not Found",
                  style: AppTextStyle.light(
                    color: AppColors.lightRed,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
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
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.bookmark_border_rounded,
                            size: 15,
                            color: AppColors.lightYellow,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Add Watchlist',
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
