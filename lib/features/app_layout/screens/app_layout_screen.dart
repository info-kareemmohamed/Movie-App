import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/features/app_layout/cubit/app_layout_cubit.dart';

class AppLayoutScreen extends StatelessWidget {
  const AppLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLayoutCubit, AppLayoutStates>(
      builder: (context, state) {
        var cubit = context.read<AppLayoutCubit>();
        return Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            animationCurve: Curves.easeInOutCubicEmphasized,
            height: 53,
            index: cubit.currentIndex,
            color: Colors.white,
            backgroundColor: AppColors.primary,
            onTap: (int index) {
              cubit.changeBottomNavBar(index);
            },
            items: cubit.items,
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}