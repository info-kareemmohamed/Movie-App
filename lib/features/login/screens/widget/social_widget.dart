import 'package:flutter/material.dart';
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
            print('Facebook');
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
            print('Google');
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
