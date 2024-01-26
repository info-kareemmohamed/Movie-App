import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/cubit/moviecubit.dart';
import 'package:flutter_project/core/services/cubit/moviestate.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/movie_details/screens/details_screen.dart';

import '../../../../core/services/datasource/model/MovieResponse.dart';
import '../../../../core/services/datasource/remote/apiLinks/AllApi.dart';

class TrendingDailyScreen extends StatelessWidget {
  const TrendingDailyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesStat>(
      builder: (context, state) {
        return FutureBuilder(
          future: context.read<MoviesCubit>().getAllMovies(popularmovieurl),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Results> results = snapshot.data ?? [];
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Row(
                    children: List.generate(
                      results.length,
                      (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MovieDetails()));
                            },
                            child: Container(
                              height: 155,
                              width: 232,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${results[index].backdropPath}'),
                                  fit: BoxFit
                                      .cover, // Adjust the fit as per your requirement
                                ),
                                borderRadius: BorderRadius.circular(9.96),
                              ),
                              margin: const EdgeInsets.all(8.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  results[index].title!,
                                  style: AppTextStyle.semiBold(
                                    color: AppColors.lightYellow,
                                    fontSize: 17,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star_rounded,
                                      color: Colors.yellow,
                                      size: 20,
                                    ),
                                    Text(
                                      ' ${results[index].voteAverage!} | ',
                                      style: AppTextStyle.semiBold(
                                        color: AppColors.lightYellow,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      results[index].originalLanguage!,
                                      style: AppTextStyle.medium(
                                        color: AppColors.lightRed,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }
}
