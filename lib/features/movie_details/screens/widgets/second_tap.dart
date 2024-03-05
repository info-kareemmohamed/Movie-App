import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/common/widget/app_widget.dart';
import 'package:flutter_project/features/movie_details/model/MovieDetailsResponse.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/video_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubit/video/video_movie_cubit.dart';
import '../../cubit/video/video_movie_state.dart';
import '../../../../core/services/datasource/remote/apiLinks/AllApi.dart';
import '../../../../core/utils/app_text_style.dart';

class SecondTabScreen extends StatelessWidget {
  SecondTabScreen({Key? key, required this.movie}) : super(key: key);
  Movie movie;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoMovieCubit()
        ..getvideoMovie(getEndPoint2("videos", movie.id.toString())),
      child: BlocBuilder<VideoMovieCubit, VideoMoviesStates>(
          builder: (context, state) {
        if (state is VideoMoviesSuccessState) {
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                    height: 155.h,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(AppImages.poster),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                    margin:  EdgeInsets.symmetric(
                      vertical: 15.h,
                      horizontal: 40.w,
                    ),
                    child: VideoApp(urlVideo: state.movies[index].key??""),
                  ),
                  childCount:state.movies.length //state.movies.results.length,
                ),
              ),
            ],
          );
        } else if (state is VideoMoviesInitialState) {
          return const Center(child: CircularProgressIndicator());
        }  else if(state is VideoMoviesErrorState){
          return AppWidget.buildErrorScreen(state.message??"Sorry Not Found");
        }
         else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
