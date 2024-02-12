import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/common/app_widget.dart';
import 'package:flutter_project/core/services/datasource/remote/apiLinks/AllApi.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_text_style.dart';
import '../movie_details/screens/details_screen.dart';
import 'cubit/FavouriteMovieCubit.dart';
import 'cubit/FavouriteMovieState.dart';

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
                appBar: _buildAppBar(),
                body: ListView.builder(
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                    '${imageBaseUrl}${state.movies[index].backdropPath}'),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MovieDetails(
                                              id: state.movies[index].id
                                                  .toString())));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 190,
                                      child: Text(
                                        state.movies[index].title ?? "Name",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      state.movies[index].originalLanguage ??
                                          "",
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      state.movies[index].genre,
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<FavouriteMovieCubit>()
                                      .deleteFavouriteMovie(
                                          state.movies[index].id.toString());
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  size: 30,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else if (state is FavouriteMovieEmptyState) {
              return _buildLottieScreen();
            } else if (state is FavouriteMovieErrorState) {
              return AppWidget.buildErrorScreen(state.message??"Not Found");
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.darkTheme,
      centerTitle: true,
      title: Text(
        'Favourite',
        style: AppTextStyle.extraBold(
          color: Colors.white,
          fontSize: 18.74,
        ),
      ),
    );
  }

  Widget _buildLottieScreen() {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      appBar: _buildAppBar(),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Lottie.asset('assets/animation/Fv.json')),
      ),
    );
  }

}
