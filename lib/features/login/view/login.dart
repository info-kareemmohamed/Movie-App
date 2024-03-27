import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/app/styles/icon_broken.dart';
import 'package:flutter_project/core/common/widget/app_button_primary.dart';
import 'package:flutter_project/core/helper/firebase.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/core/utils/space.dart';
import 'package:flutter_project/features/login/cubit/LoginCubit.dart';
import 'package:flutter_project/features/login/cubit/LoginStates.dart';
import 'package:flutter_project/features/login/view/social_widget.dart';
import '../../../core/helper/navigation.dart';
import '../../../core/utils/app_routes.dart';
import '../../../core/common/widget/custom_text_filed.dart';
import '../../../generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userPassController = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) {
        return Form(
          key: fromKey,
          child: Scaffold(
            backgroundColor: AppColors.darkTheme,
            body: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
<<<<<<< Updated upstream
                    const SpaceVH(height: 50.0),
=======
                    SpaceVH(height: 20.h),
>>>>>>> Stashed changes
                    Image.asset(
                      AppImages.huluLogo,
                      width: 170,
                      fit: BoxFit.fill,
                    ),
<<<<<<< Updated upstream
                    const SpaceVH(height: 50),
=======
                    SpaceVH(height: 30.h),
>>>>>>> Stashed changes
                    CustomTextFiled(
                      controller: userEmailController,
                      keyBordType: TextInputType.emailAddress,
                      icon: IconBroken.Profile,
                      hintTxt: S.of(context).login_hinttxt_email,
                      validator: (value) => cubit.validateMessageEmail(value),
                    ),
                    const SizedBox(height: 10),
                    CustomTextFiled(
                      controller: userPassController,
                      keyBordType: TextInputType.text,
                      icon:
                          cubit.visibility ? IconBroken.Show : IconBroken.Hide,
                      isObs: cubit.visibility,
                      visible: () {
                        cubit.changePasswordVisibility();
                      },
                      hintTxt: S.of(context).login_hinttxt_password,
                      validator: (value) =>
                          cubit.validateMessagePasswoed(value),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: TextButton(
                          onPressed: () async {
                            await FirebaseHelper.forgotPassword(
                                userEmailController.text);
                          },
                          child: Text(
                            S.of(context).login_hinttxt_forgot_password,
                            style: AppTextStyle.regular(
                              color: AppColors.lightRed,
                              fontSize: 12.9,
                            ),
                          ),
                        ),
                      ),
                    ),
<<<<<<< Updated upstream
                    const SpaceVH(height: 20.0),
=======
                    SpaceVH(height: 15.h),
>>>>>>> Stashed changes
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          AppButtonPrimary(
                              condition: state is! LoginLoadingState,
                              onTap: () => cubit.setDataToLogin(
                                  fromKey.currentState!.validate(),
                                  userEmailController.text,
                                  userPassController.text),
                              text: S.of(context).login_button_signin),
<<<<<<< Updated upstream
                          const SizedBox(
                            height: 50,
                          ),
                          const SocialWidget(),
                          const SizedBox(
                            height: 30,
=======
                          SizedBox(
                            height: 30.h,
                          ),
                          const SocialWidget(),
                          SizedBox(
                            height: 20.h,
>>>>>>> Stashed changes
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                S.of(context).login_dont_have_account,
                                style: AppTextStyle.regular(
                                  fontSize: 14.12,
                                  color: AppColors.lightRed,
                                ),
                              ),
                              TextButton(
                                child: Text(
                                  S.of(context).login_register,
                                  style: AppTextStyle.regular(
                                    fontSize: 14.12,
                                    color: AppColors.primary,
                                  ),
                                ),
                                onPressed: () {
<<<<<<< Updated upstream
                                  NavigationHelper.navigateToReplacement(
                                      AppRoute.SIGN_UP);
=======
                                  NavigationHelper.navigateTo(
                                    AppRoute.SIGN_UP,
                                  );
>>>>>>> Stashed changes
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
      },
    );
  }
}
