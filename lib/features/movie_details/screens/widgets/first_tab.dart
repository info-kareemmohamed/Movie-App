import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/cubit/info_movie_cubit.dart';
import 'package:flutter_project/core/services/cubit/info_movie_state.dart';
import 'package:flutter_project/core/services/datasource/remote/apiLinks/AllApi.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/movie_details/cubit/movie_details_cubit.dart';
import 'package:flutter_project/features/movie_details/data/models/movie_trailers_model.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/more_like_this_movie.dart';

import '../../../../core/services/datasource/model/MovieResponse.dart';

class FirstTabScreen extends StatelessWidget {
   FirstTabScreen({Key? key,required this.movieId}) : super(key: key);
   String? movieId;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MovieDetailsCubit>();
    cubit.allMovies = false;



    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
       return BlocBuilder<InfoMovieCubit, InfoMovieStates>(
            builder: (context, state) {
            
              if (state is InfoMovieSuccessState) {

                 return FutureBuilder(
                     future:context.read<InfoMovieCubit>().getInfoMovie(getEndPoint("movie", '${movieId}')),
                     builder:(context ,snapshot)=>
                    CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: RichText(
                                text: TextSpan(
                                  style: AppTextStyle.black(
                                    color: AppColors.lightYellow,
                                    fontSize: 35,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: snapshot.data?.title??"",
                                    ),
                                    TextSpan(
                                      text: "lastName",
                                      style:
                                      const TextStyle(color: AppColors.primary),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 25,
                              ),
                              child: SizedBox(
                                height: 55,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: trailersList[0].type!.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 5),
                                    child: Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.lightYellow,
                                          width: 1.7,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Center(
                                        child: Text(
                                          trailersList[0].type![index],
                                          style: AppTextStyle.medium(
                                            color: AppColors.lightRed,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              trailersList[0].title ?? 'Not Found',
                              textAlign: TextAlign.center,
                              style: AppTextStyle.regular(
                                color: AppColors.lightYellow,
                                fontSize: 12,
                              ),
                            ),
                            Container(
                              height: 155,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              margin: const EdgeInsets.all(25),
                            ),
                            Text(
                              'More Like This',
                              style: AppTextStyle.semiBold(
                                color: AppColors.lightYellow,
                                fontSize: 21.24,
                              ),
                            ),
                            const MoreLikeThisMovie(),
                          ],
                        ),
                      ),
                    ],
                                   ),
                 );
              } else if (state is InfoMovieInitialState) {
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
      },
    );
  }
}
