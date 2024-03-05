import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondOnBoardingScreen extends StatelessWidget {
  const SecondOnBoardingScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:  EdgeInsets.only(top: 90.0.h),
        child: Column(
          children: [
            Image.asset(AppImages.huluLogo),
            SizedBox(
              height: 35.h,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: -30.w,
                  child: Image.asset(
                    AppImages.poster4,
                  ),
                ),
                Positioned(
                  left: 35.0.w,
                  child: Image.asset(
                    AppImages.poster5,
                  ),
                ),
                Positioned(
                  right: -35.w,
                  child: Image.asset(
                    AppImages.poster3,
                  ),
                ),
                Positioned(
                  right: 45.0.w,
                  child: Image.asset(
                    AppImages.poster2,
                  ),
                ),
                Center(
                  child: Image.asset(
                    AppImages.poster,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 62.h,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Unlimited\n',
                    style: AppTextStyle.black(
                      fontSize: 33.01.sp,
                      color: AppColors.primary,
                    ),
                  ),
                  WidgetSpan(
                    child: SizedBox(height: 30.h),
                  ),
                  TextSpan(
                    text: 'movies, TV shows & More... \n',
                    style: AppTextStyle.black(
                      fontSize: 18.29.sp,
                    ),
                  ),
                  WidgetSpan(
                    child: SizedBox(height: 35.w),
                  ),
                  TextSpan(
                    text: 'Watch anywhere, cancel\nanytime.',
                    style: AppTextStyle.medium(
                      fontSize: 13.3.sp,
                      color: AppColors.lightYellow,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
