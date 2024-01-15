import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/movie_details/cubit/movie_details_cubit.dart';

class ShowLessFilms extends StatelessWidget {
  const ShowLessFilms({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MovieDetailsCubit>();
    return Positioned(
      left: 140,
      top: 260,
      child: Column(
        children: [
          Text(
            'Show More',
            style: AppTextStyle.extraBold(
              color: AppColors.lightYellow,
              fontSize: 20,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.lightYellow,
              size: 40,
            ),
            onPressed: () {
              cubit.showAllMovies();
            },
          )
        ],
      ),
    );
  }
}
