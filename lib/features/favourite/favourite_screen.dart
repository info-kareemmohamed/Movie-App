import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/common/app_widget.dart';
import 'package:flutter_project/core/services/datasource/remote/apiLinks/AllApi.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../core/helper/navigation.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_routes.dart';
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
                      padding: EdgeInsets.all(8.w),
                      child: Row(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 50.w,
                                backgroundImage: NetworkImage(
                                    '${imageBaseUrl}${state.movies[index].backdropPath}'),
                              ),
                              SizedBox(
                                width: 20.w,
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
                                      width: 190.w,
                                      child: Text(
                                        state.movies[index].title ?? "Name",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      state.movies[index].originalLanguage ??
                                          "",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      state.movies[index].genre,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15.sp,
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
                                icon: Icon(
                                  Icons.delete,
                                  size: 30.w,
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
              return AppWidget.buildErrorScreen(
                  state.message ?? "Sorry Not Found");
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
          fontSize: 18.74.sp,
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
            padding: EdgeInsets.all(10.w),
            child: Lottie.asset('assets/animation/Fv.json')),
      ),
    );
  }
}
