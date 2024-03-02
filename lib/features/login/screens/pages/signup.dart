import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/app/styles/icon_broken.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/login/cubit/SignUpCubit/sign_up_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/space.dart';
import '../widget/main_button.dart';
import '../widget/text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userPassController = TextEditingController();
  final TextEditingController userPassConfirmController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SignUpCubit>();
    return BlocBuilder<SignUpCubit, SignUpStates>(
      builder: (context, state) {
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
                      controller: userNameController,
                      icon: IconBroken.Profile,
                      keyBordType: TextInputType.text,
                      hintTxt: 'User Name',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '       Please Enter Your Name';
                        }
                        if (cubit.isName(value)) {
                          return '       Please Enter Valid Name\n       example example';
                        } else {
                          return null;
                        }
                      },
                    ),
                    customTextField(
                      controller: userEmailController,
                      keyBordType: TextInputType.emailAddress,
                      icon: IconBroken.Message,
                      hintTxt: 'Email Address',
                      validator: (value) {
                        if (value.isEmpty) {
                          return '       Please Enter Email Address';
                        }
                        if (!cubit.isValidEmail(value)) {
                          return '       Please Enter a Valid Email Address';
                        }
                        if (!cubit.isGmailEmail(value)) {
                          return '       Please Enter a Valid Gmail Address';
                        }
                      },
                    ),
                    customTextField(
                      controller: userPassController,
                      keyBordType: TextInputType.visiblePassword,
                      icon:
                          cubit.visibility ? IconBroken.Show : IconBroken.Hide,
                      isObs: cubit.visibility,
                      visible: () {
                        cubit.changePasswordVisibility();
                      },
                      hintTxt: 'Password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '       Please Enter Password';
                        } else if (value.length < 6) {
                          return '       Please Enter Password';
                        }
                      },
                    ),
                    customTextField(
                      controller: userPassConfirmController,
                      keyBordType: TextInputType.visiblePassword,
                      icon: cubit.visibilityConfirmPass
                          ? IconBroken.Show
                          : IconBroken.Hide,
                      isObs: cubit.visibilityConfirmPass,
                      visible: () {
                        cubit.changePasswordVisibilityConfirmPass();
                      },
                      hintTxt: 'Confirm Password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '       Please Enter Confirm Password';
                        } else if (value.length < 6) {
                          return '       Confirm Password Too Short';
                        } else if (value != userPassController.text) {
                          return '       Confirm Password Not Matched';
                        }
                      },
                    ),

                    const SpaceVH(height: 25.0),

                    ConditionalBuilder(
                      condition: state is! SignUpLoadingState,
                      builder: (context) => Mainbutton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            cubit.signUp(
                                name: userNameController.text,
                                email: userEmailController.text,
                                password: userPassController.text,
                                context: context);
                          }
                        },
                        text: 'Create Account',
                        txtColor: AppColors.darkTheme,
                        btnColor: AppColors.primary,
                      ),
                      fallback: (context) => const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
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
      },
    );
  }
}
