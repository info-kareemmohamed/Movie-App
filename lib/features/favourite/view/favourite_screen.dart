import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/common/widget/app_widget.dart';
import 'package:flutter_project/core/services/datasource/remote/apiLinks/AllApi.dart';
import 'package:flutter_project/features/favourite/view/app_bar.dart';
import 'package:flutter_project/features/favourite/view/lottie_screen.dart';

import '../../../core/helper/navigation.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_routes.dart';
import '../../../core/utils/app_text_style.dart';
import '../../movie_details/screens/details_screen.dart';
import '../cubit/FavouriteMovieCubit.dart';
import '../cubit/FavouriteMovieState.dart';
import 'icon_delete.dart';
import 'movie_image.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FavouriteMovieCubit()..getFavouriteMovie(),
        child: BlocBuilder<FavouriteMovieCubit, FavouriteMovieStates>(
          builder: (context, state) {
            if (state is FavouriteMovieInitialState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FavouriteMovieSuccessState) {
              return Scaffold(
                backgroundColor: AppColors.darkTheme,
                appBar: const FavouriteAppBar(),
                body: ListView.builder(
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FavouriteMovieImage(
                                  backdropPath: state.movies[index].backdropPath
                                      .toString()),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  NavigationHelper.navigateTo(
                                    AppRoute.MOVIE_DETAILS,
                                    arguments: state.movies[index].id,
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 190,
                                      child: Text(
                                        state.movies[index].title ?? "Name",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      state.movies[index].originalLanguage ??
                                          "",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      state.movies[index].genre,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              FavouriteIconDelete(
                                onPressed: () => context
                                    .read<FavouriteMovieCubit>()
                                    .deleteFavouriteMovie(
                                        state.movies[index].id.toString()),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else if (state is FavouriteMovieEmptyState) {
              return const FavouriteLottieScreen();
            } else if (state is FavouriteMovieErrorState) {
              return AppWidget.buildErrorScreen(
                  state.message ?? "Sorry Not Found");
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
