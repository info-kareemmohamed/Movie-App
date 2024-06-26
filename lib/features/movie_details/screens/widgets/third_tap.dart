import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/common/widget/app_widget.dart';
import 'package:flutter_project/core/model/app_data.dart';
import 'package:flutter_project/core/services/datasource/remote/apiLinks/AllApi.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/movie_details/cubit/movie_details_cubit.dart';
import 'package:flutter_project/features/movie_details/model/MovieDetailsResponse.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/cast/cast_movie_cubit.dart';
import '../../cubit/cast/cast_movie_state.dart';

class ThirdTabScreen extends StatelessWidget {
  ThirdTabScreen({Key? key, required this.movie}) : super(key: key);

  Movie movie;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            CastMovieCubit()..getCastMovie(ApiUrl.instance.getEndPoint2("credits", movie.id)),
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
                            padding: EdgeInsets.symmetric(
                              vertical: 8.h,
                              horizontal: 10.w,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider(
                                    '${ApiUrl.instance.imageBaseUrl}${state.casts[index].profilePath}',
                                  ),
                                  radius: 60.r,
                                ),
                                Text(
                                  state.casts[index].name ?? "Name",
                                  style: AppTextStyle.semiBold(
                                    fontSize: 17.sp,
                                  ),
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
                } else if (state is CastMovieErrorState) {
                  return AppWidget.buildErrorScreen(
                      state.message ?? "Sorry Not Found");
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          },
        ));
  }
}
