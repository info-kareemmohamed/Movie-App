import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/first_tab.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/second_tap.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/sliver_app_bar.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/third_tap.dart';

class MovieDetails extends StatelessWidget {
  final dynamic id;
  final List<Widget> myTabViews;

  MovieDetails({Key? key, required this.id})
      : myTabViews = [
    FirstTabScreen(movieId: id),
    SecondTabScreen(movieId: id),
    ThirdTabScreen(movieId: id),
  ],
        super(key: key);

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
                const SliverAppbar(),
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
