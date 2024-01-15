import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/movie_details/cubit/movie_details_cubit.dart';
import 'package:flutter_project/features/movie_details/data/models/movie_trailers_model.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/more_like_this_movie.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/movie_info.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/trailers.dart';

class SecondTabScreen extends StatelessWidget {
  SecondTabScreen({Key? key});

  List<TrailersModel> trailersList = [
    TrailersModel(
      title:
          'The mercurial villain Loki resumes his role as the God of Mischief in a new series that takes place after the events of "Avengers: Endgame".',
      year: '2021',
      type: 'Action Adventure',
      category: 'Tv Series',
      stars: [
        'Tom Hiddleston',
        'Owen Wilson',
        'Sophia Di Martino',
        'Tara Strong',
      ],
      releaseDate: 'June 9 - 2021',
      productionCompany: 'Marvel Studios',
      director: 'Michael Waldron',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MovieDetailsCubit>();
    cubit.allMovies = false;
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
                            children: const [
                              TextSpan(
                                text: 'LO',
                              ),
                              TextSpan(
                                text: 'KI',
                                style: TextStyle(color: AppColors.primary),
                              ),
                            ],
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          '${trailersList[0].year ?? 'Not Found'} . ${trailersList[0].type ?? 'Not Found'} . ${trailersList[0].category ?? 'Not Found'}',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.regular(
                            color: AppColors.lightRed,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      const Trailers(),
                      MovieInfo(model: trailersList[0]),
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
