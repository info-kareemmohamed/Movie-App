import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThirdOnBoardingScreen extends StatelessWidget {
  const ThirdOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Stack(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 70.h, left: 15.w),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'DOWNLOAD\n',
                          style: AppTextStyle.black(
                            fontSize: 49.56.sp,
                            color: AppColors.primary,
                          ),
                        ),
                        TextSpan(
                          text: 'SHOWS\n',
                          style: AppTextStyle.black(
                            fontSize: 49.56.sp,
                          ),
                        ),
                        TextSpan(
                          text: '& MOVIES',
                          style: AppTextStyle.black(
                            fontSize: 49.56.sp,
                          ),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 215.h),
                child: Center(child: Image.asset(AppImages.iphoneImage)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text('''Always have something
         to watch offline ''',
            style: AppTextStyle.medium(
              fontSize: 11.44.sp,
              color: AppColors.lightYellow,
            )),
      ],
    );
  }
}
