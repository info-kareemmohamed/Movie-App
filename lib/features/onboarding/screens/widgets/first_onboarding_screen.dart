import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/login/screens/pages/login.dart';
import 'package:flutter_project/features/onboarding/screens/onboarding_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/navigation.dart';
import '../../../../core/utils/app_routes.dart';

class FirstOnBoardingScreen extends StatelessWidget {
  const FirstOnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 60.h,
                  child: Image.asset(AppImages.poster11), //11
                ),
                Positioned(
                  top: 10.h,
                  left: 12.w,
                  child: Image.asset(AppImages.poster8), //8
                ),
                Positioned(
                  left: 185.w,
                  child: Image.asset(AppImages.poster10), //10
                ),
                Positioned(
                  left: 230.w,
                  top: 30.h,
                  child: Image.asset(AppImages.poster9), //9
                ),
                Positioned(
                  left: 270.h,
                  top: 160.w,
                  child: Image.asset(AppImages.poster12), //12
                ),
                Positioned(
                  left: 100.h,
                  top: 260.w,
                  child: Image.asset(AppImages.poster13), //13
                ),
                Positioned(
                  left: 5.w,
                  top: 350.h,
                  child: Image.asset(AppImages.poster6), //6
                ),
                Positioned(
                  left: 140.w,
                  top: 390.h,
                  child: Image.asset(AppImages.poster7), //7
                ),
                Positioned(
                  top: 240.h,
                  child: Image.asset(AppImages.ellipse), //E
                ),
                Positioned(
                  top: 320.h,
                  child: Image.asset(AppImages.shadow), //s
                ),
              ],
            ),
          ),
          Image.asset(
            AppImages.huluLogo,
            width: 120.w,
            fit: BoxFit.fill,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                text: 'Enjoy The ',
                style: AppTextStyle.semiBold(
                  fontSize: 14.4.sp,
                ),
                children: [
                  TextSpan(
                    text: 'Best',
                    style: AppTextStyle.semiBold(
                      fontSize: 14.4.sp,
                      color: AppColors.primary,
                    ),
                  ),
                  TextSpan(
                    text:
                        ''' Movies and TV shows\n                            Out there.''',
                    style: AppTextStyle.semiBold(
                      fontSize: 14.4.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            '''Watch full seasons of exclusive streaming series,episodes, 
            hitmovies, Hulu Originals, kids shows, and more...''',
            style: AppTextStyle.regular(
              fontSize: 9.68.sp,
              color: AppColors.lightYellow,
            ),
          ),
           SizedBox(
            height: 65.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OnBoardingScreen()));
            },
            child: Container(
              height: 44.h,
              width: 305.w,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(5.84.w),
              ),
              child: Center(
                child: Text(
                  'Get Started',
                  style: AppTextStyle.regular(
                    fontSize: 11.94.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              NavigationHelper.navigateToReplacement(
                  AppRoute.LOGIN);
            },
            child: Text(
              'Login',
              style: AppTextStyle.regular(
                color: Colors.white,
                fontSize: 14.17.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
