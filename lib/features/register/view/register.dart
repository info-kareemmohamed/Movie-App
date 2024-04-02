import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/app/styles/icon_broken.dart';
import 'package:flutter_project/features/register/cubit/register_cubit.dart';
import 'package:flutter_project/features/register/view/row_sign_in.dart';
import 'package:flutter_project/features/register/view/row_text.dart';
import 'package:flutter_project/features/register/view/top_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/common/widget/app_button_primary.dart';
import '../../../core/common/widget/custom_text_filed.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/space.dart';
import '../../../generated/l10n.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController userNameController = TextEditingController(),
      userEmailController = TextEditingController(),
      userPassController = TextEditingController(),
      userPassConfirmController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RegisterCubit>();
    return BlocBuilder<RegisterCubit, RegisterStates>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Scaffold(
            backgroundColor: AppColors.darkTheme,
            body: Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const TopText(),
                    CustomTextFiled(
                      controller: userNameController,
                      icon: IconBroken.Profile,
                      keyBordType: TextInputType.text,
                      hintTxt: S.of(context).register_hinttxt_user_name,
                      validator: (value) => cubit.validateMessageName(value),
                    ),
                    CustomTextFiled(
                      controller: userEmailController,
                      keyBordType: TextInputType.emailAddress,
                      icon: IconBroken.Message,
                      hintTxt: S.of(context).register_hinttxt_email_address,
                      validator: (value) => cubit.validateMessageEmail(value),
                    ),
                    CustomTextFiled(
                      controller: userPassController,
                      keyBordType: TextInputType.visiblePassword,
                      icon:
                          cubit.visibility ? IconBroken.Show : IconBroken.Hide,
                      isObs: cubit.visibility,
                      visible: () {
                        cubit.changePasswordVisibility();
                      },
                      hintTxt: S.of(context).register_hinttxt_password,
                      validator: (value) =>
                          cubit.validateMessagePasswoed(value),
                    ),
                    CustomTextFiled(
                      controller: userPassConfirmController,
                      keyBordType: TextInputType.visiblePassword,
                      icon: cubit.visibilityConfirmPass
                          ? IconBroken.Show
                          : IconBroken.Hide,
                      isObs: cubit.visibilityConfirmPass,
                      visible: () {
                        cubit.changePasswordVisibilityConfirmPass();
                      },
                      hintTxt: S.of(context).register_hinttxt_confirm_password,
                      validator: (value) =>
                          cubit.validateMessagePasswoedConfirm(
                              value, userPassController.text),
                    ),
                    SpaceVH(height: 25.h),
                    AppButtonPrimary(
                      condition: state is! RegisterLoadingState,
                      text: S.of(context).register_txt_create_account,
                      onTap: () => cubit.setDataToSignUp(
                          formKey.currentState!.validate(),
                          userNameController.text,
                          userEmailController.text,
                          userPassController.text),
                    ),
                    const RowText(),
                    const RowSignIn(),
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
