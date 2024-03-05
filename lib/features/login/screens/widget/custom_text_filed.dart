import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

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
      padding: EdgeInsets.all(15.0),
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
                borderRadius: BorderRadius.circular(20.0)),
            hintStyle: AppTextStyle.regular(
              fontSize: 14,
              color: AppColors.lightRed,
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.darkTheme),
                borderRadius: BorderRadius.circular(20.0)),
            hintText: hintTxt,
            suffixIcon: IconButton(
              icon: Icon(
                icon,
                color: AppColors.lightRed,
              ),
              onPressed: visible,
            )),
        style: AppTextStyle.regular(
          fontSize: 12.9,
          color: AppColors.lightYellow,
        ),
      ),
    );
  }
}
