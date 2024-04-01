import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/common/widget/app_widget.dart';
import 'package:flutter_project/core/services/datasource/remote/apiLinks/AllApi.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/features/movie_details/cubit/details/info_movie_cubit.dart';
import 'package:flutter_project/features/movie_details/cubit/details/info_movie_state.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/first_tab.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/second_tap.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/sliver_app_bar.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/third_tap.dart';

class MovieDetailsScreen extends StatelessWidget {
   MovieDetailsScreen({Key? key,required this.id}) : super(key: key);
 dynamic id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InfoMovieCubit()..getInfoMovie(getEndPoint("movie",id)),
      child: BlocBuilder<InfoMovieCubit, InfoMovieStates>(
        builder: (context, state) {
          if (state is InfoMovieSuccessState) {
            return DefaultTabController(
              length: 3,
              child: Scaffold(
                body: DefaultTabController(
                  length: 3,
                  child: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        SliverAppbar(
                          movie: state.movie,
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
          } else if (state is InfoMovieErrorState) {
            return AppWidget.buildErrorScreen(
                state.message ?? "Sorry Not Found");
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
