import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/home/cubit/home_screen_cubit.dart';
import 'package:flutter_project/features/home/screens/widget/latest_movies.dart';
import 'package:flutter_project/features/home/screens/widget/sliver_app_bar_home.dart';
import 'package:flutter_project/features/home/screens/widget/trending_daily_movies.dart';
import 'package:flutter_project/features/home/screens/widget/trending_weekly_movies.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeScreenCubit>();
    return BlocBuilder<HomeScreenCubit, HomeScreenStates>(
      builder: (context, state) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: AppColors.darkTheme,
            body: DefaultTabController(
              length: 3,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [const SliverAppbarHome()];
                },
                body: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          cubit.selectedValue == 'Daily'
                              ? const TrendingDailyScreen()
                              : const TrendingWeeklyScreen(),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'Latest Movies',
                              style: AppTextStyle.semiBold(
                                color: AppColors.lightYellow,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const LatestMovies(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
