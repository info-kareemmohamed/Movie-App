import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/profile_picture/view/profile_picture_add.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/l10n.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Image.asset(
                AppImages.huluLogo,
                height: 62.h,
                width: 93.w,
              )),
              Text(
                S.of(context).profile_toptext,
                textAlign: TextAlign.center,
                style: AppTextStyle.semiBold(
                  color: AppColors.lightYellow,
                  fontSize: 34.37.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: const ProfilePictureAdd(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
