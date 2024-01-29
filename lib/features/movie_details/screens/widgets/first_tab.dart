import 'package:flutter/material.dart';
import 'package:flutter_project/core/services/datasource/model/MovieDetailsResponse.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/movie_details/data/models/movie_trailers_model.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/more_like_this_movie.dart';

class FirstTabScreen extends StatelessWidget {
  FirstTabScreen({Key? key, required this.movie}) : super(key: key);
  Movie movie;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  movie.title ?? "Not Found",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.black(
                    color: AppColors.primary,
                    fontSize: 25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 25,
                ),
                child: SizedBox(
                  height: 55,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movie.genres.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.lightYellow,
                            width: 1.7,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            movie.genres[index].name,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.medium(
                              color: AppColors.lightRed,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                trailersList[0].title ?? 'Not Found',
                textAlign: TextAlign.center,
                style: AppTextStyle.regular(
                  color: AppColors.lightYellow,
                  fontSize: 12,
                ),
              ),
              Container(
                height: 155,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: const EdgeInsets.all(25),
              ),
              Text(
                'More Like This',
                style: AppTextStyle.semiBold(
                  color: AppColors.lightYellow,
                  fontSize: 21.24,
                ),
              ),
               MoreLikeThisMovie(movieId: movie.id,),
            ],
          ),
        ),
      ],
    );
  }
}
