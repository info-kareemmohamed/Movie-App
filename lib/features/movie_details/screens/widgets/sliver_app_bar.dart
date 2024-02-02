import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/app/styles/icon_broken.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/movie_details/cubit/movie_details_cubit.dart';

import '../../../../core/services/datasource/model/MovieDetailsResponse.dart';
import '../../../../core/utils/Constants.dart';
import '../../../favourite/model/movie_favourite.dart';

class SliverAppbar extends StatelessWidget {
  const SliverAppbar({super.key,required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {

    final List<Tab> myTabs = [
      Tab(child: Text('EPISODES', style: AppTextStyle.medium(fontSize: 16))),
      Tab(child: Text('TRAILERS', style: AppTextStyle.medium(fontSize: 16))),
      Tab(child: Text('CASTS', style: AppTextStyle.medium(fontSize: 16))),
    ];
    bool isFavourite=false;
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        isFavourite=box.get(movie.id.toString())!=null;

        return SliverAppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30),

              child: StatefulBuilder(

                builder:(context, setState) => IconButton(
                  onPressed: () {
                    setState((){
                      isFavourite=box.get(movie.id.toString())!=null;

                      if(!isFavourite) {
                        box.put(movie.id.toString(), new MovieFavourite(
                            backdropPath: movie.backdropPath,
                            id: movie.id,
                            title: movie.title,
                            originalLanguage: movie.originalLanguage,
                            genre:movie.genres?[0].name??""));

                      }else{
                        box.delete(movie.id.toString());
                      }
                      isFavourite=!isFavourite;
                    });

                     },
                  icon: isFavourite
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
                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
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