import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import 'main_button.dart';

class AppButtonPrimary extends StatelessWidget {
  AppButtonPrimary(
      {super.key,
      required this.condition,
      required this.onTap,
      required this.text});

  final String text;
  bool condition;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: condition,
      builder: (context) => Mainbutton(
        onTap: onTap,
        text: text,
        txtColor: AppColors.darkTheme,
        btnColor: AppColors.primary,
      ),
      fallback: (context) => const Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ),
      ),
    );
  }
}
