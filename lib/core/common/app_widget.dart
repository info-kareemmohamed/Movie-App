import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

class AppWidget{

  static Widget buildErrorScreen(String title ) {
    return Container(
      color: AppColors.darkTheme,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: AppTextStyle.semiBold(
              color: Colors.red,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }



}