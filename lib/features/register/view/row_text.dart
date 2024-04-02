import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../generated/l10n.dart';

class RowText extends StatelessWidget {
  const RowText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 50.w,
        vertical: 20.h,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              children: [
                TextSpan(
                  text: S.of(context).register_by_logging_you_agree_to_our,
                  style: AppTextStyle.regular(
                    fontSize: 10.48.sp,
                    color: AppColors.lightRed,
                  ),
                ),
                TextSpan(
                  text: S.of(context).register_terms_conditions,
                  style: AppTextStyle.regular(
                    fontSize: 10.48.sp,
                    color: AppColors.lightYellow,
                  ),
                ),
                TextSpan(
                  text: S.of(context).register_and,
                  style: AppTextStyle.regular(
                    fontSize: 10.48.sp,
                    color: AppColors.lightRed,
                  ),
                ),
                TextSpan(
                  text: S.of(context).register_privacy_policy,
                  style: AppTextStyle.regular(
                    fontSize: 10.48.sp,
                    color: AppColors.lightYellow,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
