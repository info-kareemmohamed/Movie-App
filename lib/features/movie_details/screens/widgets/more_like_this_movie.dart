import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/features/movie_details/cubit/movie_details_cubit.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/show_less_movies.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/show_more_movies.dart';

class MoreLikeThisMovie extends StatelessWidget {
  const MoreLikeThisMovie({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MovieDetailsCubit>();
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        return Stack(
          children: [
            Visibility(
              visible: !cubit.allMovies,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: List.generate(
                      2,
                      (rowIndex) => Row(
                        children: List.generate(
                          2,
                          (index) => Container(
                            height: 190,
                            width: 133,
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 120,
              right: -90,
              child: Image.asset(
                AppImages.shadowMoreFilms,
              ),
            ),
            cubit.allMovies ? const ShowMoreFilms() : const ShowLessFilms(),
          ],
        );
      },
    );
  }
}
