import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/home/screens/widget/latest_movies.dart';
import 'package:flutter_project/features/home/screens/widget/sliver_app_bar_home.dart';
import 'package:flutter_project/features/home/screens/widget/trending_daily_movies.dart';
import 'package:flutter_project/features/home/screens/widget/watching.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.darkTheme,
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [SliverAppbarHome()];
            },
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TrendingDailyScreen(),
                      const WatchingMovies(),
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
  }
}
