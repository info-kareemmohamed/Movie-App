import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/common/app_widget.dart';
import 'package:flutter_project/core/services/datasource/model/MovieDetailsResponse.dart';
import 'package:flutter_project/core/services/datasource/remote/apiLinks/AllApi.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
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
                  return CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: state.casts.length,
                          (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      '${imageBaseUrl}${state.casts[index].profilePath}'),
                                  radius: 60,
                                ),
                                Text(
                                  state.casts[index].name ?? "Name",
                                  style: AppTextStyle.semiBold(
                                      fontSize: 17,
                                      color: AppColors.lightYellow),
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
                }else if(state is CastMovieErrorState){
                  return AppWidget.buildErrorScreen(state.message??"Sorry Not Found");
                }
                else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          },
        ));
  }
}
