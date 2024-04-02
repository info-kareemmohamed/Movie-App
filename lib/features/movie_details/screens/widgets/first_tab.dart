import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/common/widget/app_widget.dart';
import 'package:flutter_project/core/services/datasource/remote/apiLinks/AllApi.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/movie_details/cubit/video/video_movie_cubit.dart';
import 'package:flutter_project/features/movie_details/cubit/video/video_movie_state.dart';
import 'package:flutter_project/features/movie_details/model/MovieDetailsResponse.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/more_like_this_movie.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/video_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';

class FirstTabScreen extends StatelessWidget {
  FirstTabScreen({Key? key, required this.movie}) : super(key: key);
  Movie movie;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoMovieCubit()
        ..getvideoMovie(ApiUrl.instance.getEndPoint2("videos", movie.id.toString())),
      child: BlocBuilder<VideoMovieCubit, VideoMoviesStates>(
          builder: (context, state) {
        if (state is VideoMoviesSuccessState) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        movie.title ?? "Not Found",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.black(
                          color: AppColors.primary,
                          fontSize: 25.sp,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: 25.w,
                      ),
                      child: SizedBox(
                        height: 55.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movie.genres?.length,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                              horizontal: 5.w,
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 5.h,
                                horizontal: 8.w,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.lightYellow,
                                  width: 1.7.w,
                                ),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: Center(
                                child: Text(
                                  movie.genres?[index].name ?? "",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.medium(
                                    color: AppColors.lightRed,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      movie.overview ?? 'Not Found',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.regular(
                        color: AppColors.lightYellow,
                        fontSize: 12.sp,
                      ),
                    ),
                    state.movies.isNotEmpty
                        ? Container(
                            height: 168.h,
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            margin: EdgeInsets.symmetric(
                              horizontal: 25.w,
                              vertical: 25.h,
                            ),
                            child: VideoApp(
                              urlVideo: state.movies[0].key.toString(),
                            ),
                          )
                        : Container(
                            height: 190.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.darkBlue,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: 25.w, vertical: 25.h),
                            child: Center(
                                child: Text(
                              'Sorry Trailer Not Found',
                              style: AppTextStyle.semiBold(
                                color: AppColors.lightYellow,
                              ),
                            )),
                          ),
                    Text(
                      S.of(context).details_more_like_this,
                      style: AppTextStyle.semiBold(
                        color: AppColors.lightYellow,
                        fontSize: 21.24.sp,
                      ),
                    ),
                    SizedBox(
                      height: 450.h,
                      child: MoreLikeThisMovie(
                        movieId: movie.id,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (state is VideoMoviesInitialState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is VideoMoviesErrorState) {
          return AppWidget.buildErrorScreen(state.message ?? "Sorry Not Found");
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
