import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/cubit/info_movie_cubit.dart';
import 'package:flutter_project/core/services/cubit/info_movie_state.dart';
import 'package:flutter_project/core/services/datasource/remote/apiLinks/AllApi.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/first_tab.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/second_tap.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/sliver_app_bar.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/third_tap.dart';

class MovieDetails extends StatelessWidget {
  MovieDetails({Key? key, required this.id}) : super(key: key);
  final dynamic id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      InfoMovieCubit()..getInfoMovie(getEndPoint("movie", id)),
      child: BlocBuilder<InfoMovieCubit, InfoMovieStates>(
        builder: (context, state) {
          if (state is InfoMovieSuccessState) {
            return DefaultTabController(
              length: 3,
              child: Scaffold(
                backgroundColor: AppColors.darkTheme,
                body: DefaultTabController(
                  length: 3,
                  child: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        SliverAppbar(
                          image: state.movie.posterPath,
                          title: state.movie.title!,
                        ),
                      ];
                    },
                    body: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        FirstTabScreen(movie: state.movie),
                        SecondTabScreen(movie: state.movie),
                        ThirdTabScreen(movie: state.movie),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (state is InfoMovieInitialState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Sorry Data Not Found'));
          }
        },
      ),
    );
  }
}