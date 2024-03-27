import 'package:flutter/material.dart';
import 'package:flutter_project/core/helper/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../generated/l10n.dart';

class RowSignIn extends StatelessWidget {
  const RowSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).register_already_have_account,
          style: AppTextStyle.regular(
            fontSize: 14.12.sp,
            color: AppColors.lightRed,
          ),
        ),
        TextButton(
          child: Text(
            S.of(context).register_signin,
            style: AppTextStyle.regular(
              fontSize: 14.12.sp,
              color: AppColors.primary,
            ),
          ),
          onPressed: () {
            NavigationHelper.goBack();
          },
        ),
      ],
    );
  }
}
