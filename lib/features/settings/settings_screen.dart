import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/app/styles/icon_broken.dart';
import 'package:flutter_project/core/model/main_user.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/app_layout/cubit/app_layout_cubit.dart';
import 'package:flutter_project/features/login/screens/widget/profile_picture_container.dart';
import 'package:flutter_project/features/settings/widget/flutter_switch_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helper/navigation.dart';
import '../../core/utils/app_routes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLayoutCubit, AppLayoutStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.read<AppLayoutCubit>().isDark
              ? AppColors.darkTheme
              : AppColors.white,
          appBar: AppBar(
            backgroundColor: context.read<AppLayoutCubit>().isDark
                ? AppColors.darkTheme
                : AppColors.white,
            centerTitle: true,
            title: Text(
              'Settings',
              style: AppTextStyle.extraBold(
                color: context.read<AppLayoutCubit>().isDark
                    ? AppColors.white
                    : AppColors.darkTheme,
                fontSize: 18.74.sp,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfilePictureContainer(
                        color: 0xFF1CE783,
                        top: UserMain.instance?.profilePicture ==
                                'assets/images/pi_4.png'
                            ? 60.h
                            : 40.h,
                        image: UserMain.instance!.profilePicture,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Profile',
                            style: AppTextStyle.medium(
                              color: AppColors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Container(
                            height: 35.h,
                            width: 180.w,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(25.w)),
                            child: Center(
                              child: Text(
                                context.read<AppLayoutCubit>().selectedValue ==
                                        'Arabic'
                                    ? "الاسم بالعربي"
                                    : UserMain.instance?.name ?? "",
                                textAlign: TextAlign.center,
                                style: AppTextStyle.semiBold(
                                  color: AppColors.darkTheme,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25.h),
                          Text(
                            'App Language',
                            style: AppTextStyle.medium(
                              color: AppColors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            height: 40.h,
                            width: 190.w,
                            padding: EdgeInsets.symmetric(horizontal: 7.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.w),
                              color: AppColors.lightRed,
                            ),
                            child: DropdownButton(
                              items:
                                  context.read<AppLayoutCubit>().dropMenuItems,
                              icon: Icon(
                                IconBroken.Arrow___Right_2,
                                size: 20.w,
                                color: AppColors.white,
                              ),
                              borderRadius: BorderRadius.circular(15.w),
                              dropdownColor:
                                  AppColors.darkTheme.withOpacity(0.8),
                              underline: const SizedBox(),
                              hint: Text(
                                context.read<AppLayoutCubit>().selectedValue,
                                style: AppTextStyle.regular(
                                  color: AppColors.white,
                                  fontSize: 11.sp,
                                ),
                              ),
                              value:
                                  context.read<AppLayoutCubit>().selectedValue,
                              style: AppTextStyle.regular(
                                fontSize: 11.sp,
                                color: AppColors.white,
                              ),
                              isExpanded: true,
                              onChanged: (String? value) {
                                context.read<AppLayoutCubit>().dropValue(value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      FlutterSwitchButton(
                        type: 'Mode',
                        options: 'Light & Dark Mode',
                        activeIcon: Icons.dark_mode_sharp,
                        inActiveIcon: Icons.sunny,
                        onToggle: ((value) {
                          context.read<AppLayoutCubit>().changeMode();
                        }),
                        value: context.read<AppLayoutCubit>().isDark,
                      ),
                      FlutterSwitchButton(
                        type: 'Notification',
                        options: 'Allow Notification',
                        onToggle: ((value) {
                          context.read<AppLayoutCubit>().allowNotification();
                        }),
                        value: context.read<AppLayoutCubit>().isAllow,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      context.read<AppLayoutCubit>().currentIndex = 1;
                      await FirebaseAuth.instance.signOut().then((value) =>
                          NavigationHelper.navigateToReplacement(
                              AppRoute.LOGIN));
                    },
                    child: Container(
                      height: 45.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(34.w),
                      ),
                      child: Center(
                        child: Text(
                          'Logout',
                          style: AppTextStyle.semiBold(
                            color: AppColors.darkTheme,
                            fontSize: 17.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
