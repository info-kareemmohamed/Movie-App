import 'package:flutter/material.dart';

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
        SpaceVH(height: 15),
        Text(
         S.of(context).register_toptext_create_account,
          style: AppTextStyle.semiBold(
            fontSize: 33.05,
            color: AppColors.primary,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            S.of(context).register_toptext,
            textAlign: TextAlign.center,
            style: AppTextStyle.regular(
              color: AppColors.lightRed,
              fontSize: 12.13,
            ),
          ),
        ),
        SpaceVH(height: 20.0),
      ],
    );
  }
}
