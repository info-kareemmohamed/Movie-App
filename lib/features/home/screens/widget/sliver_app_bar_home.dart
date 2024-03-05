import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/home/cubit/topRated/top_rated_movies_cubit.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/home/cubit/home_screen_cubit.dart';
import 'package:flutter_project/features/movie_details/screens/details_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/navigation.dart';
import '../../../../core/utils/app_routes.dart';

class SliverAppbarHome extends StatelessWidget {
  const SliverAppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeScreenCubit>();
    return BlocBuilder<HomeScreenCubit, HomeScreenStates>(
      builder: (context, state) {
        return SliverAppBar(
          backgroundColor: AppColors.darkTheme,
          collapsedHeight: 500.h,
          flexibleSpace: FlexibleSpaceBar(
            background: BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
              builder: (context, state) {
                if (state is TopRatedSuccessState) {
                  return CarouselSlider(
                    items: state.movies.map(
                      (results) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () {
                                NavigationHelper.navigateTo(
                                    AppRoute.MOVIE_DETAILS,
                                    arguments: results.id);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500${results.posterPath}'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ).toList(),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: true,
                      height: 600.h,
                    ),
                  );
                } else if (state is TopRatedInitialState) {
                  return const SizedBox();
                } else {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Text(
                        'Sorry Not Found',
                        style: AppTextStyle.semiBold(
                          color: Colors.red,
                          fontSize: 25.sp,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          bottom: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: SizedBox(
                width: 250.w,
                child: Container(
                  padding: EdgeInsets.only(left: 15.w),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15.w)),
                  child: DropdownButton(
                    items: cubit.dropMenuItems,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 40.w,
                      color: AppColors.lightYellow,
                    ),
                    borderRadius: BorderRadius.circular(15.w),
                    dropdownColor: AppColors.darkTheme.withOpacity(0.7),
                    underline: const SizedBox(),
                    hint: Text(
                      cubit.selectedValue,
                      style: AppTextStyle.black(
                        color: AppColors.lightYellow,
                        fontSize: 18.sp,
                      ),
                    ),
                    value: cubit.selectedValue,
                    style: AppTextStyle.black(
                      fontSize: 18.sp,
                      color: AppColors.lightYellow,
                    ),
                    isExpanded: true,
                    onChanged: (String? value) {
                      cubit.dropValue(value);
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
