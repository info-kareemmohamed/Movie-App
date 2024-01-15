import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/features/login/screens/pages/social_icon.dart';

import 'or_drive.dart';

class SocialSignUp extends StatelessWidget {
  const SocialSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SocalIcon(
              iconSrc: AppImages.googleIcon,
              press: () {},
            ),
            SocalIcon(
              iconSrc: AppImages.facebookIcon,
              press: () {},
            ),
            SocalIcon(
              iconSrc: AppImages.twitterIcon,
              press: () {},
            ),
          ],
        ),
      ],
    );
  }
}
