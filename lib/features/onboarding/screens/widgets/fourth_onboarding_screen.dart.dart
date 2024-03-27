import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FourthOnBoardingScreen extends StatelessWidget {
  const FourthOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, top: 50.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'PARTY MODE\n',
                  style: AppTextStyle.black(
                    fontSize: 33.94.sp,
                    color: AppColors.primary,
                  ),
                ),
                TextSpan(
                  text: 'is now Live',
                  style: AppTextStyle.black(
                    fontSize: 33.94.sp,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Container(
              height: 200.h,
              width: 282.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.darkBlue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 85.h,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 40.w,
                          top: 25.h,
                          child: CircleAvatar(
                            radius: 12.5.r,
                            backgroundColor: AppColors.lightRed,
                            child: Icon(
                              Icons.visibility_outlined,
                              color: Colors.white,
                              size: 15.sp,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20.w,
                          top: 25.h,
                          child: CircleAvatar(
                            radius: 12.5.r,
                            child: Image.asset(
                              AppImages.avatar,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'YOUR\nPARTY\n',
                            style: AppTextStyle.semiBold(
                              fontSize: 17.67.sp,
                            ),
                          ),
                          TextSpan(
                            text: 'Still Requesting\n',
                            style: AppTextStyle.light(
                              fontSize: 8.83.sp,
                              color: AppColors.lightRed,
                            ),
                          ),
                          TextSpan(
                            text: 'None',
                            style: AppTextStyle.light(
                              fontSize: 8.83.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 13.w),
                      child: Container(
                        height: 25.h,
                        width: 89.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'Request',
                            style: AppTextStyle.semiBold(
                              fontSize: 9.84.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 70.w),
            child: Container(
              height: 200.h,
              width: 282.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.darkBlue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 85.h,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 20.w,
                          top: 25.h,
                          child: CircleAvatar(
                            radius: 12.5.r,
                            child: Image.asset(
                              AppImages.avatar,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 40.w,
                          top: 25.h,
                          child: CircleAvatar(
                            radius: 12.5.r,
                            child: Image.asset(
                              AppImages.avatar2,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 60.w,
                          top: 25.h,
                          child: CircleAvatar(
                            radius: 12.5.r,
                            child: Image.asset(
                              AppImages.avatar3,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 80.w,
                          top: 25.h,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 12.r,
                              backgroundColor: const Color(0XFF111928),
                              child: Text(
                                '+20',
                                style: AppTextStyle.medium(
                                  fontSize: 8.67.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'FRIEND’S\nPARTY\n',
                              style: AppTextStyle.semiBold(
                                fontSize: 17.67.sp,
                              ),
                            ),
                            TextSpan(
                              text: 'Watching OPPENHEIMER\n',
                              style: AppTextStyle.light(
                                fontSize: 8.83.sp,
                                color: AppColors.lightRed,
                              ),
                            ),
                            TextSpan(
                              text: ' 34min in ',
                              style: AppTextStyle.light(
                                fontSize: 8.83.sp,
                              ),
                            ),
                          ],
                        ),
                      )),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 13.w),
                      child: Container(
                        height: 25.h,
                        width: 67.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.primary,
                        ),
                        child: Center(
                          child: Text(
                            'Join',
                            style: AppTextStyle.medium(
                              fontSize: 11.81.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: RichText(
              text: TextSpan(
                style: AppTextStyle.medium(
                  fontSize: 11.44.sp,
                  color: AppColors.lightYellow,
                ),
                children: const [
                  TextSpan(
                    text: 'Enjoy watching your Favorite movies & shows\n',
                  ),
                  TextSpan(
                    text: 'with your friends using ',
                  ),
                  TextSpan(
                    text: 'Party Mode',
                    style: TextStyle(
                      color: AppColors.primary,
                    ),
                  ),
                  TextSpan(
                    text: '\nparty holds up to 20',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
