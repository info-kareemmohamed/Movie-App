import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/movie_details/screens/details_screen.dart';

import '../../../../core/services/cubit/moviecubit.dart';
import '../../../../core/services/cubit/moviestate.dart';
import '../../../../core/services/datasource/model/MovieResponse.dart';
import '../../../../core/services/datasource/remote/apiLinks/AllApi.dart';

class LatestMovies extends StatelessWidget {
  const LatestMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesStat>(
      builder: (context, state) {
        return FutureBuilder(
          future: context.read<MoviesCubit>().getAllMovies(nowplayingmovieurl),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Results> results = snapshot.data ?? [];

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                  child: Row(
                    children: List.generate(
                      results.length,
                          (index) => GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MovieDetails()));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 190,
                              width: 135,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${results[index].backdropPath}'),
                                  fit: BoxFit
                                      .cover, // Adjust the fit as per your requirement
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
                                    'OPPENHEIMER ',
                                    style: AppTextStyle.light(
                                      color: AppColors.lightYellow,
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    '3h',
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
