import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/datasource/model/MovieDetailsResponse.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/video_player.dart';
import '../../../../core/services/cubit/video_movie_cubit.dart';
import '../../../../core/services/cubit/video_movie_state.dart';
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
                    height: 155,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(AppImages.poster),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 40,
                    ),
                    child: VideoApp(urlVideo: state.movies.results[index].key),
                  ),
                  childCount: state.movies.results.length,
                ),
              ),
            ],
          );
        } else if (state is VideoMoviesInitialState) {
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
      }),
    );
  }
}
