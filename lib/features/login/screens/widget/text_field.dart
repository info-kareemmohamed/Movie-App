import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';

Widget customTextField({
  required String hintTxt,
  required IconData icon,
  required TextEditingController controller,
  bool isObs = false,
  TextInputType? keyBordType,
  required validator,
  Function()? visible,
}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
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
            icon: Icon(icon),
            onPressed: visible ?? () {},
          )),
      style: AppTextStyle.regular(
        fontSize: 12.9,
        color: AppColors.lightYellow,
      ),
    ),
  );
}
