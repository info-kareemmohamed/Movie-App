import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/datasource/model/MovieDetailsResponse.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/movie_details/cubit/movie_details_cubit.dart';

class ThirdTabScreen extends StatelessWidget {
  ThirdTabScreen({Key? key, required this.movie}) : super(key: key);

  Movie movie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 5,
                        (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage(
                              AppImages.avatar2,
                            ),
                            radius: 60,
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Text(
                            'Name Name Name',
                            style: AppTextStyle.semiBold(
                                fontSize: 20, color: AppColors.lightYellow),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}