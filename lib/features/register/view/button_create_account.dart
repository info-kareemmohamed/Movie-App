import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';
import '../../login/screens/widget/main_button.dart';

class ButtonCreateAccount extends StatelessWidget {
  ButtonCreateAccount(
      {super.key,
      required this.condition,
      required this.onTap});

  bool condition;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: condition,
      builder: (context) => Mainbutton(
        onTap: onTap,
        text: 'Create Account',
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
