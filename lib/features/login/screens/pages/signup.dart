import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/home/screens/HomeScreen.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/space.dart';
import '../widget/main_button.dart';
import '../widget/text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userPassController = TextEditingController();
  final TextEditingController userPassConfirmController =
      TextEditingController();
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userPhoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool secure = true;
  bool secure2 = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: AppColors.darkTheme,
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SpaceVH(height: 40.0),
                Text(
                  'Create Account',
                  style: AppTextStyle.semiBold(
                    fontSize: 33.05,
                    color: AppColors.primary,
                  ),
                ),
                const SpaceVH(height: 5.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Register now and start exploring all that our app has to offer. We’re excited to welcome you to our community!',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.regular(
                      color: AppColors.lightRed,
                      fontSize: 12.13,
                    ),
                  ),
                ),
                const SpaceVH(height: 50.0),
                customTextField(
                  controller: userEmailController,
                  keyBordType: TextInputType.emailAddress,
                  icon: Icons.person_outline_outlined,
                  hintTxt: 'Email Address',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email required";
                    }
                  },
                ),
                customTextField(
                  controller: userPassController,
                  icon: secure ? Icons.visibility : Icons.visibility_off,
                  isObs: secure,
                  visible: () {
                    setState(() {
                      secure = !secure;
                    });
                  },
                  keyBordType: TextInputType.visiblePassword,
                  hintTxt: 'Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password required';
                    } else if (value.length < 6) {
                      return 'Password Too Short';
                    }
                  },
                ),
                customTextField(
                  controller: userPassConfirmController,
                  keyBordType: TextInputType.visiblePassword,
                  icon: secure2 ? Icons.visibility : Icons.visibility_off,
                  isObs: secure2,
                  visible: () {
                    setState(() {
                      secure2 = !secure2;
                    });
                  },
                  hintTxt: 'Confirm Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm Password required';
                    } else if (value.length < 6) {
                      return 'Confirm Password Too Short';
                    } else if (value != userPassController.text) {
                      return 'Confirm Password Not Matched';
                    }
                  },
                ),
                customTextField(
                  controller: userPhoneController,
                  icon: Icons.phone,
                  keyBordType: TextInputType.phone,
                  hintTxt: 'Your Number',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone Number required";
                    }
                  },
                ),
                const SpaceVH(height: 25.0),
                Mainbutton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    }
                  },
                  text: 'Create Account',
                  txtColor: AppColors.darkTheme,
                  btnColor: AppColors.primary,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 20,
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "By logging.you agree to our ",
                              style: AppTextStyle.regular(
                                fontSize: 10.48,
                                color: AppColors.lightRed,
                              ),
                            ),
                            TextSpan(
                              text: "Terms & Conditions",
                              style: AppTextStyle.regular(
                                fontSize: 10.48,
                                color: AppColors.lightYellow,
                              ),
                            ),
                            TextSpan(
                              text: " and ",
                              style: AppTextStyle.regular(
                                fontSize: 10.48,
                                color: AppColors.lightRed,
                              ),
                            ),
                            TextSpan(
                              text: "Privacy Policy",
                              style: AppTextStyle.regular(
                                fontSize: 10.48,
                                color: AppColors.lightYellow,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // const SpaceVH(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: AppTextStyle.regular(
                        fontSize: 14.12,
                        color: AppColors.lightRed,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        'Sign in',
                        style: AppTextStyle.regular(
                          fontSize: 14.12,
                          color: AppColors.primary,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
