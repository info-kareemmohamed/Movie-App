import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/first_tab.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/second_tap.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/sliver_app_bar.dart';

class MovieDetails extends StatelessWidget {
  MovieDetails({super.key});

  final List<Widget> myTabViews = [
    FirstTabScreen(),
    SecondTabScreen(),
    FirstTabScreen(),
  ];

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
              return [
                SliverAppbar(),
              ];
            },
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: myTabViews,
            ),
          ),
        ),
      ),
    );
  }
}
