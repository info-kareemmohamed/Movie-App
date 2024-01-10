import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.darkTheme,
      body: Center(
          child: Text(
        'Login Screen',
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
