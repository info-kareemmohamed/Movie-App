import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../core/utils/app_colors.dart';
import 'app_bar.dart';

class FavouriteLottieScreen extends StatelessWidget {
  const FavouriteLottieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FavouriteAppBar(),
      body: Center(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Lottie.asset(AppImages.FavouriteLottie)),
      ),
    );
  }
}
