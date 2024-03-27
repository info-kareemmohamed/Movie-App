import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/helper/firebase.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/features/login/cubit/LoginCubit.dart';
import 'package:flutter_project/features/login/cubit/LoginStates.dart';

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
<<<<<<< Updated upstream
                    height: 65,
=======
                    height: 50.h,
>>>>>>> Stashed changes
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                GestureDetector(
                  onTap: () {
                    context
                        .read<LoginCubit>()
                        .signInWithGoogle();
                  },
                  child: Image.asset(
                    AppImages.googleIcon,
<<<<<<< Updated upstream
                    height: 65,
=======
                    height: 50.h,
>>>>>>> Stashed changes
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ));
  }
}
