import 'package:flutter/material.dart';
import 'package:flutter_project/features/login/screens/pages/social_icon.dart';


import 'or_drive.dart';

class SocalSignUp extends StatelessWidget {
  const SocalSignUp({
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
              iconSrc: "assets/icon/facebook.svg",
              press: () {},
            ),
            SocalIcon(
              iconSrc: "assets/icon/twitter.svg",
              press: () {},
            ),
            SocalIcon(
              iconSrc: "assets/icon/google-plus.svg",
              press: () {},
            ),
          ],
        ),
      ],
    );
  }
}