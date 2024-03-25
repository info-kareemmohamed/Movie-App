import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/utils/space.dart';
import '../../../generated/l10n.dart';

class TopText extends StatelessWidget {
  const TopText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpaceVH(height: 15.h),
        Text(
          S.of(context).register_toptext_create_account,
          style: AppTextStyle.semiBold(
            fontSize: 33.05.sp,
            color: AppColors.primary,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Text(
            S.of(context).register_toptext,
            textAlign: TextAlign.center,
            style: AppTextStyle.regular(
              color: AppColors.lightRed,
              fontSize: 12.13.sp,
            ),
          ),
        ),
        SpaceVH(height: 20.h),
      ],
    );
  }
}
