import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/datasource/model/MovieDetailsResponse.dart';
import 'package:flutter_project/core/services/datasource/remote/apiLinks/AllApi.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/movie_details/cubit/movie_details_cubit.dart';

import '../../../../core/services/cubit/cast_movie_cubit.dart';
import '../../../../core/services/cubit/cast_movie_state.dart';

class ThirdTabScreen extends StatelessWidget {
  ThirdTabScreen({Key? key, required this.movie}) : super(key: key);

  Movie movie;

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
        create: (context) =>
        CastMovieCubit()..getCastMovie(getEndPoint2("credits", movie.id)),
    child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        return BlocBuilder<CastMovieCubit, CastMovieStates>(
          builder: (context, state) {
            if (state is CastMovieSuccessState) {
              return  CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: 5,
                          (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             CircleAvatar(
                              backgroundImage:NetworkImage('${imageBaseUrl}${state.casts[index].profilePath}'),
                              radius: 60,
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Text(
                              state.casts[index].name??"Name",
                              style: AppTextStyle.semiBold(
                                  fontSize: 20, color: AppColors.lightYellow),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is CastMovieInitialState) {
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
      },
    )
    );
  }
}