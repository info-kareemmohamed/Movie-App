import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_style.dart';

class AppWidget {
  static Widget buildErrorScreen(String title) {
    return Container(
      color: AppColors.darkTheme,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Text(
            title,
            style: AppTextStyle.semiBold(
              color: Colors.red,
              fontSize: 25.sp,
            ),
          ),
        ),
      ),
    );
  }
}
