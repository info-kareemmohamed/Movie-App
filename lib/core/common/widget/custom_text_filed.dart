import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_style.dart';

class CustomTextFiled extends StatelessWidget {
  CustomTextFiled({
    super.key,
    required this.hintTxt,
    required this.icon,
    required this.controller,
    this.isObs = false,
    required this.keyBordType,
    required this.validator,
    this.visible,
  });

  String hintTxt;
  IconData icon;
  TextEditingController controller;
  bool isObs;

  TextInputType keyBordType;
  var validator;
  Function()? visible;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: TextFormField(
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textAlignVertical: TextAlignVertical.center,
        obscureText: isObs,
        keyboardType: keyBordType,
        validator: validator,
        decoration: InputDecoration(
            fillColor: AppColors.darkBlue,
            filled: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.darkTheme),
              borderRadius: BorderRadius.circular(20.0.r),
            ),
            hintStyle: AppTextStyle.regular(
              fontSize: 14.sp,
              color: AppColors.lightRed,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.darkTheme),
              borderRadius: BorderRadius.circular(20.0.r),
            ),
            hintText: hintTxt,
            suffixIcon: IconButton(
              icon: Icon(
                icon,
                color: AppColors.lightRed,
              ),
              onPressed: visible,
            )),
        style: AppTextStyle.regular(
          fontSize: 12.9.sp,
          color: AppColors.lightYellow,
        ),
      ),
    );
  }
}
