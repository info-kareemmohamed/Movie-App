import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../generated/l10n.dart';

class FavouriteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FavouriteAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.darkTheme,
      centerTitle: true,
      title: Text(
        S.of(context).favourite_favourite,
        style: AppTextStyle.extraBold(
          color: Colors.white,
          fontSize: 18.74,
        ),
      ),
    );
  }
}
