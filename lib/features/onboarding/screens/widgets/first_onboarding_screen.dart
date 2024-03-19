import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/onboarding/screens/onboarding_screen.dart';

import '../../../../core/helper/navigation.dart';
import '../../../../core/utils/app_routes.dart';

class FirstOnBoardingScreen extends StatelessWidget {
  const FirstOnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      body: Column(
        children: [
          Image.asset(
            'assets/images/onBoarding.png',
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6,
            fit: BoxFit.fill,
          ),
          Image.asset(
            AppImages.huluLogo,
            width: 120,
            fit: BoxFit.cover,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                text: 'Enjoy The ',
                style: AppTextStyle.semiBold(
                  fontSize: 14.4,
                ),
                children: [
                  TextSpan(
                    text: 'Best',
                    style: AppTextStyle.semiBold(
                      fontSize: 14.4,
                      color: AppColors.primary,
                    ),
                  ),
                  TextSpan(
                    text:
                        ''' Movies and TV shows\n                            Out there.''',
                    style: AppTextStyle.semiBold(
                      fontSize: 14.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            '''Watch full seasons of exclusive streaming series,episodes, 
            hitmovies, Hulu Originals, kids shows, and more...''',
            style: AppTextStyle.regular(
              fontSize: 9.68,
              color: AppColors.lightYellow,
            ),
          ),
          const SizedBox(
            height: 65,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OnBoardingScreen()));
            },
            child: Container(
              height: 44,
              width: 305,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(5.84),
              ),
              child: Center(
                child: Text(
                  'Get Started',
                  style: AppTextStyle.regular(
                    fontSize: 11.94,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              NavigationHelper.navigateToReplacement(AppRoute.LOGIN);
            },
            child: Text(
              'Login',
              style: AppTextStyle.regular(
                color: Colors.white,
                fontSize: 14.17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
