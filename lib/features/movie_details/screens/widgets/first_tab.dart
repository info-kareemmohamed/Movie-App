import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/movie_details/cubit/movie_details_cubit.dart';
import 'package:flutter_project/features/movie_details/data/models/movie_trailers_model.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/more_like_this_movie.dart';

class FirstTabScreen extends StatelessWidget {
  const FirstTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MovieDetailsCubit>();
    cubit.allMovies = false;
    String? firstName;
    String? lastName;

    if (trailersList[0].name != null && trailersList[0].name!.isNotEmpty) {
      String fullName = trailersList[0].name!;
      int middleIndex = (fullName.length / 2).ceil();
      firstName = fullName.substring(0, middleIndex).toUpperCase();
      lastName = fullName.substring(middleIndex).toUpperCase();
    }

    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: RichText(
                          text: TextSpan(
                            style: AppTextStyle.black(
                              color: AppColors.lightYellow,
                              fontSize: 35,
                            ),
                            children: [
                              TextSpan(
                                text: firstName,
                              ),
                              TextSpan(
                                text: lastName,
                                style:
                                    const TextStyle(color: AppColors.primary),
                              ),
                            ],
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
                            itemCount: trailersList[0].type!.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.lightYellow,
                                    width: 1.7,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Text(
                                    trailersList[0].type![index],
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
                      const MoreLikeThisMovie(),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
