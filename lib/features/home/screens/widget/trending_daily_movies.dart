import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/cubit/trending_day_movies_cubit.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/home/screens/widget/movie_card.dart';

class TrendingDailyScreen extends StatelessWidget {
  const TrendingDailyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingDayMoviesCubit, TrendingDayMoviesStates>(
      builder: (context, state) {
        if (state is TrendingDayMoviesSuccessState) {
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
                  (index) => MovieCard(
                    imageLink: state.movies[index].backdropPath,
                    title: state.movies[index].title,
                    movieId: state.movies[index].id.toString(),
                    releaseDate: state.movies[index].releaseDate,
                  ),
                ),
              ),
            ),
          );
        } else if (state is TrendingDayMoviesInitialState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Sorry Not Found',
                style: AppTextStyle.semiBold(
                  color: Colors.red,
                  fontSize: 25,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
