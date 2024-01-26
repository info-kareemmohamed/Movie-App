import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/cubit/moviecubit.dart';
import 'package:flutter_project/core/services/cubit/moviestate.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/movie_details/screens/details_screen.dart';

class TrendingDailyScreen extends StatelessWidget {
  const TrendingDailyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesStat>(
      builder: (context, state) {
        if (state is MoviesTSuccessState) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: Row(
                children: List.generate(
                  state.movies.length,
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
                                  'https://image.tmdb.org/t/p/w500${state.movies[index].backdropPath}'),
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
                              state.movies[index].title ?? "NNN",
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
                                  ' ${state.movies[index].voteAverage ?? "MMM"} | ',
                                  style: AppTextStyle.semiBold(
                                    color: AppColors.lightYellow,
                                  ),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  state.movies[index].originalLanguage ??
                                      "eeee",
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
        } else if (state is MoviesInitialState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Text('Noo');
        }
      },
    );
  }
}
