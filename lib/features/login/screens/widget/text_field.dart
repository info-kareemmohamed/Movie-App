import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_style.dart';
Widget CustomTextField({
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
      textAlignVertical: TextAlignVertical.center,
      obscureText: isObs,
      keyboardType: keyBordType,
      validator: validator,
      decoration: InputDecoration(
          fillColor: blackBG,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: black),
              borderRadius: BorderRadius.circular(20.0)),
          hintStyle: hintStyle,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: black),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: hintTxt,
          suffixIcon: IconButton(
            icon: Icon(icon),
            onPressed: visible ?? () {},
          )),
      style: headline2,
    ),
  );
}
