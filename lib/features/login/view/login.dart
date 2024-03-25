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
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/widget/custom_text_filed.dart';
import '../../../core/helper/navigation.dart';
import '../../../core/utils/app_routes.dart';
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
              padding: EdgeInsets.only(top: 50.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SpaceVH(height: 50.h),
                    Image.asset(
                      AppImages.huluLogo,
                      width: 170.w,
                      fit: BoxFit.fill,
                    ),
                    SpaceVH(height: 50.h),
                    CustomTextFiled(
                      controller: userEmailController,
                      keyBordType: TextInputType.emailAddress,
                      icon: IconBroken.Profile,
                      hintTxt: S.of(context).login_hinttxt_email,
                      validator: (value) => cubit.validateMessageEmail(value),
                    ),
                    SizedBox(height: 10.h),
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
                        padding: EdgeInsets.only(right: 20.w),
                        child: TextButton(
                          onPressed: () async {
                            await FirebaseHelper.forgotPassword(
                                userEmailController.text);
                          },
                          child: Text(
                            S.of(context).login_hinttxt_forgot_password,
                            style: AppTextStyle.regular(
                              color: AppColors.lightRed,
                              fontSize: 12.9.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SpaceVH(height: 20.h),
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
                          SizedBox(
                            height: 50.h,
                          ),
                          const SocialWidget(),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                S.of(context).login_dont_have_account,
                                style: AppTextStyle.regular(
                                  fontSize: 14.12.sp,
                                  color: AppColors.lightRed,
                                ),
                              ),
                              TextButton(
                                child: Text(
                                  S.of(context).login_register,
                                  style: AppTextStyle.regular(
                                    fontSize: 14.12.sp,
                                    color: AppColors.primary,
                                  ),
                                ),
                                onPressed: () {
                                  NavigationHelper.navigateToReplacement(
                                    AppRoute.SIGN_UP,
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
      },
    );
  }
}
