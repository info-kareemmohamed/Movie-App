import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/home/cubit/home_screen_cubit.dart';

class SliverAppbarHome extends StatelessWidget {
  const SliverAppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeScreenCubit>();

    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        return SliverAppBar(
          backgroundColor: AppColors.darkTheme,
          collapsedHeight: 450,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: Image.asset(
              AppImages.poster14,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          bottom: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: SizedBox(
                width: 250.0,
                child: DropdownButton(
                  items: cubit.dropMenuItems,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 40,
                    color: AppColors.lightYellow,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                  dropdownColor: AppColors.darkTheme.withOpacity(0.7),
                  underline: const SizedBox(),
                  hint: Text(
                    'Trending Now',
                    style: AppTextStyle.semiBold(
                      color: AppColors.lightYellow,
                    ),
                  ),
                  value: cubit.selectedValue,
                  style: AppTextStyle.semiBold(
                    fontSize: 19.66,
                    color: AppColors.lightYellow,
                  ),
                  isExpanded: true,
                  onChanged: (String? value) {
                    cubit.dropValue(value);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
