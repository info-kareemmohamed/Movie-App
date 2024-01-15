import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/core/utils/space.dart';
import 'package:flutter_project/features/login/screens/pages/signup.dart';
import 'package:flutter_project/features/login/screens/pages/social_icons.dart';
import 'package:flutter_project/features/login/screens/widget/main_button.dart';
import 'package:flutter_project/features/login/screens/widget/text_field.dart';
import 'package:flutter_project/features/movie_details/screens/details_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userName = TextEditingController();
  TextEditingController userPass = TextEditingController();
  final fromKey = GlobalKey<FormState>();
  bool secure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      child: Scaffold(
        backgroundColor: AppColors.darkTheme,
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SpaceVH(height: 50.0),
                Image.asset(
                  AppImages.huluLogo,
                  width: 170,
                  fit: BoxFit.fill,
                ),
                const SpaceVH(height: 50),
                customTextField(
                  controller: userName,
                  icon: Icons.person_outline_outlined,
                  hintTxt: 'Email or UserName',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "username required";
                    }
                  },
                ),
                const SizedBox(height: 10),
                customTextField(
                  controller: userPass,
                  icon: secure ? Icons.visibility : Icons.visibility_off,
                  isObs: secure,
                  visible: () {
                    setState(() {
                      secure = !secure;
                    });
                  },
                  hintTxt: 'Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password required";
                    }
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: AppTextStyle.regular(
                          color: AppColors.lightRed,
                          fontSize: 12.9,
                        ),
                      ),
                    ),
                  ),
                ),
                const SpaceVH(height: 20.0),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Mainbutton(
                        onTap: () {
                          if (fromKey.currentState!.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MovieDetails()));
                          }
                        },
                        text: 'Sign in',
                        txtColor: AppColors.darkTheme,
                        btnColor: AppColors.primary,
                      ),
                      const SocialSignUp(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have account?',
                            style: AppTextStyle.regular(
                              fontSize: 14.12,
                              color: AppColors.lightRed,
                            ),
                          ),
                          TextButton(
                            child: Text(
                              'Register',
                              style: AppTextStyle.regular(
                                fontSize: 14.12,
                                color: AppColors.primary,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (builder) => const SignUpPage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
