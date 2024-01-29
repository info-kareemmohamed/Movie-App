import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/cubit/similar_movie_cubit.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/features/movie_details/cubit/movie_details_cubit.dart';
import 'package:flutter_project/features/movie_details/screens/details_screen.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/show_less_movies.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/show_more_movies.dart';

import '../../../../core/services/cubit/info_movie_cubit.dart';
import '../../../../core/services/cubit/info_movie_state.dart';
import '../../../../core/services/cubit/similar_movie_state.dart';
import '../../../../core/services/datasource/remote/apiLinks/AllApi.dart';
import '../../../../core/utils/app_text_style.dart';

class MoreLikeThisMovie extends StatelessWidget {
   MoreLikeThisMovie({Key? key,required this.movieId}) : super(key: key);
   dynamic movieId;
   int lastShow=5;
  @override
  Widget build(BuildContext context) {
     var cubit = context.read<MovieDetailsCubit>();

    return BlocProvider(
        create: (context) =>
        SimilarMovieCubit()..getsimilarMovie(getEndPoint2("similar", movieId)),
    child:  BlocBuilder<SimilarMovieCubit, SimilarMovieStates >(
      builder: (context, state) {
        if (state is SimilarMovieSuccessState) {
          return  Stack(
            children: [
              Visibility(
                visible: !cubit.allMovies,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: List.generate(
                            state.movie.results.length-lastShow,
                            (rowIndex) => Row(
                          children: [
                            Container(
                              height: 200,
                              width: 133,
                              decoration: BoxDecoration(
                                image:  DecorationImage(
                                  image: NetworkImage('${imageBaseUrl}${state.movie.results[rowIndex].posterPath}'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 15,
                              ),
                            ),
                            Container(
                              height: 200,
                              width: 133,
                              decoration: BoxDecoration(
                                image:  DecorationImage(
                                  image: NetworkImage('${imageBaseUrl}${state.movie.results[rowIndex+lastShow].posterPath}'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 15,
                              ),
                            )
                          ]
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          );
        } else if (state is SimilarMovieInitialState) {
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
    ),
    );

  }
}
