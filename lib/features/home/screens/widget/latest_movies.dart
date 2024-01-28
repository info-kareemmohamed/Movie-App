import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/cubit/top_rated_movies_cubit.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/home/screens/widget/movie_card.dart';

class LatestMovies extends StatelessWidget {
  const LatestMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
      builder: (context, state) {
        if (state is TopRatedSuccessState) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 5,
              ),
              child: Row(
                children: List.generate(
                    state.movies.length,
                    (index) => MovieCard(
                        imageLink: state.movies[index].backdropPath,
                        title: state.movies[index].title,
                        releaseDate: state.movies[index].releaseDate)),
              ),
            ),
          );
        } else if (state is TopRatedInitialState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Sorry Not Found',
                style: AppTextStyle.semiBold(
                  color: Colors.red,
                  fontSize: 25,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

//
// GestureDetector(
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => const MovieDetails()));
// },
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// height: 190,
// width: 135,
// decoration: BoxDecoration(
// image: DecorationImage(
// image: NetworkImage(
// 'https://image.tmdb.org/t/p/w500${state.movies[index].backdropPath}'),
// fit: BoxFit
//     .cover, // Adjust the fit as per your requirement
// ),
// borderRadius: BorderRadius.circular(10),
// ),
// margin: const EdgeInsets.symmetric(
// horizontal: 20.0,
// vertical: 15,
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left: 20),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// (state.movies[index].title?.length ?? 1) > 20
// ? '${state.movies[index].title!.substring(0, 20)} ...'
//     : state.movies[index].title ?? "Not Found",
// style: AppTextStyle.light(
// color: AppColors.lightYellow,
// fontSize: 10,
// ),
// ),
// Text(
// state.movies[index].releaseDate ?? "Not Found",
// style: AppTextStyle.light(
// color: AppColors.lightRed,
// fontSize: 10,
// ),
// ),
// const SizedBox(
// height: 15,
// ),
// GestureDetector(
// onTap: () {
// print('Save ');
// },
// child: Container(
// height: 30,
// width: 100,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// border: Border.all(
// color: AppColors.lightYellow,
// width: 2.0,
// ),
// ),
// child: Padding(
// padding: const EdgeInsets.only(left: 10.0),
// child: Row(
// children: [
// const Icon(
// Icons.bookmark_border_rounded,
// size: 15,
// color: AppColors.lightYellow,
// ),
// const SizedBox(
// width: 4,
// ),
// Text(
// 'Add Watchlist',
// style: AppTextStyle.black(
// color: AppColors.lightYellow,
// fontSize: 7,
// ),
// ),
// ],
// ),
// ),
// ),
// )
// ],
// ),
// ),
// ],
// ),
// ),
