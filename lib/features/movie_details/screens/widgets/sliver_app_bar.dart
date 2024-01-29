import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/app/styles/icon_broken.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/movie_details/cubit/movie_details_cubit.dart';

class SliverAppbar extends StatelessWidget {
  const SliverAppbar({super.key, required this.image, required this.title});

  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    final List<Tab> myTabs = [
      Tab(child: Text('EPISODES', style: AppTextStyle.medium(fontSize: 16))),
      Tab(child: Text('TRAILERS', style: AppTextStyle.medium(fontSize: 16))),
      Tab(child: Text('CASTS', style: AppTextStyle.medium(fontSize: 16))),
    ];
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        var cubit = context.read<MovieDetailsCubit>();
        return SliverAppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: IconButton(
                onPressed: () {
                  cubit.addFavourite();
                },
                icon: cubit.isFavourite
                    ? const Icon(
                  IconBroken.Heart,
                  size: 50,
                  color: Colors.red,
                )
                    : const Icon(
                  IconBroken.Heart,
                  size: 50,
                ),
              ),
            ),
          ],
          leadingWidth: 88,
          leading: Padding(
            padding: const EdgeInsets.only(left: 35, top: 5, bottom: 3.5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColors.primary.withOpacity(0.8),
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          backgroundColor: AppColors.darkTheme,
          collapsedHeight: 450,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: Stack(
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/w500${image}',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ],
            ),
          ),
          bottom: TabBar(
            indicatorColor: AppColors.green,
            dividerColor: AppColors.darkTheme,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: AppColors.lightYellow,
            tabs: myTabs,
          ),
        );
      },
    );
  }
}