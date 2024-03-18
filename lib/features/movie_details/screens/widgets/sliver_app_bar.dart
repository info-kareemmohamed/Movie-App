import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/app/styles/icon_broken.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/movie_details/cubit/movie_details_cubit.dart';
import '../../../../core/helper/hive.dart';
import '../../../../generated/l10n.dart';
import '../../../favourite/model/movie_favourite.dart';
import '../../model/MovieDetailsResponse.dart';

class SliverAppbar extends StatelessWidget {
  const SliverAppbar({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final List<Tab> myTabs = [
      Tab(
          child: Text(S.of(context).details_EPISODES,
              style: AppTextStyle.medium(fontSize: 16))),
      Tab(
          child: Text(S.of(context).details_TRAILERS,
              style: AppTextStyle.medium(fontSize: 16))),
      Tab(
          child: Text(S.of(context).details_CASTS,
              style: AppTextStyle.medium(fontSize: 16))),
    ];
    bool isFavourite = false;
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        isFavourite = HiveHelper.FavouriteBox.get(movie.id.toString()) != null;

        return SliverAppBar(
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: StatefulBuilder(
                builder: (context, setState) => IconButton(
                  onPressed: () {
                    setState(() {
                      isFavourite =
                          HiveHelper.FavouriteBox.get(movie.id.toString()) !=
                              null;

                      if (!isFavourite) {
                        HiveHelper.FavouriteBox.put(
                            movie.id.toString(),
                            MovieFavourite(
                                backdropPath: movie.backdropPath,
                                id: movie.id,
                                title: movie.title,
                                originalLanguage: movie.originalLanguage,
                                genre: movie.genres?[0].name ?? ""));
                      } else {
                        HiveHelper.FavouriteBox.delete(movie.id.toString());
                      }
                      isFavourite = !isFavourite;
                    });
                  },
                  icon: isFavourite
                      ? Icon(
                          IconBroken.Heart,
                          size: 50,
                          color: Colors.red,
                        )
                      : Icon(
                          IconBroken.Heart,
                          size: 50,
                        ),
                ),
              ),
            ),
          ],
          leadingWidth: 88,
          leading: Padding(
            padding: EdgeInsets.only(left: 35, top: 5, bottom: 3.5),
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
                  movie.posterPath != null
                      ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                      : 'https://media.istockphoto.com/id/1055079680/vector/black-linear-photo-camera-like-no-image-available.jpg?s=612x612&w=0&k=20&c=P1DebpeMIAtXj_ZbVsKVvg-duuL0v9DlrOZUvPG6UJk=',
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
