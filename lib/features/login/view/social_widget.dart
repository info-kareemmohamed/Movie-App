import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/helper/firebase.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/features/login/cubit/LoginCubit.dart';
import 'package:flutter_project/features/login/cubit/LoginStates.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(
        builder: (context, state) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    FirebaseHelper.signInWithFacebook();
                  },
                  child: Image.asset(
                    AppImages.facebookIcon,
                    height: 65.h,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 35.w,
                ),
                GestureDetector(
                  onTap: () {
                    context.read<LoginCubit>().signInWithGoogle();
                  },
                  child: Image.asset(
                    AppImages.googleIcon,
                    height: 65.h,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ));
  }
}
