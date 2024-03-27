import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/movie_details/cubit/movie_details_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';

class ButtonLessMovies extends StatelessWidget {
  const ButtonLessMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MovieDetailsCubit>();
    return Positioned(
      left: 120.w,
      top: 200.h,
      child: Column(
        children: [
          Text(
            S.of(context).details_show_more,
            style: AppTextStyle.extraBold(
              color: AppColors.lightYellow,
              fontSize: 25.sp,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.lightYellow,
              size: 40.sp,
            ),
            onPressed: () {
              cubit.showAllMovies();
            },
          ),
        ],
      ),
    );
  }
}
