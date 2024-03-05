import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';

class RowSignIn extends StatelessWidget {
  const RowSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: AppTextStyle.regular(
            fontSize: 14.12,
            color: AppColors.lightRed,
          ),
        ),
        TextButton(
          child: Text(
            'Sign in',
            style: AppTextStyle.regular(
              fontSize: 14.12,
              color: AppColors.primary,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
