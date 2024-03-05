import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';

class RowText extends StatelessWidget {
  const RowText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 20,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              children: [
                TextSpan(
                  text: "By logging.you agree to our ",
                  style: AppTextStyle.regular(
                    fontSize: 10.48,
                    color: AppColors.lightRed,
                  ),
                ),
                TextSpan(
                  text: "Terms & Conditions",
                  style: AppTextStyle.regular(
                    fontSize: 10.48,
                    color: AppColors.lightYellow,
                  ),
                ),
                TextSpan(
                  text: " and ",
                  style: AppTextStyle.regular(
                    fontSize: 10.48,
                    color: AppColors.lightRed,
                  ),
                ),
                TextSpan(
                  text: "Privacy Policy",
                  style: AppTextStyle.regular(
                    fontSize: 10.48,
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
