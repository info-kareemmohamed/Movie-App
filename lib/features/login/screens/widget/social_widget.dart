import 'package:flutter/material.dart';
import 'package:flutter_project/core/helper/firebase.dart';
import 'package:flutter_project/core/utils/app_images.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
           signInWithFacebook();
          },
          child: Image.asset(
            AppImages.facebookIcon,
            height: 65,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          width: 35,
        ),
        GestureDetector(
          onTap: () {
            signInWithGoogle();
          },
          child: Image.asset(
            AppImages.googleIcon,
            height: 65,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
