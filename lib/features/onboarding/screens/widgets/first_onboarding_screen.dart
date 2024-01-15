import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/login/screens/pages/login.dart';
import 'package:flutter_project/features/onboarding/screens/onboarding_screen.dart';

class FirstOnBoardingScreen extends StatelessWidget {
  const FirstOnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 60,
                  child: Image.asset(AppImages.poster11), //11
                ),
                Positioned(
                  top: 10,
                  left: 12,
                  child: Image.asset(AppImages.poster8), //8
                ),
                Positioned(
                  left: 185,
                  child: Image.asset(AppImages.poster10), //10
                ),
                Positioned(
                  left: 230,
                  top: 30,
                  child: Image.asset(AppImages.poster9), //9
                ),
                Positioned(
                  left: 270,
                  top: 160,
                  child: Image.asset(AppImages.poster12), //12
                ),
                Positioned(
                  left: 100,
                  top: 260,
                  child: Image.asset(AppImages.poster13), //13
                ),
                Positioned(
                  left: 5,
                  top: 350,
                  child: Image.asset(AppImages.poster6), //6
                ),
                Positioned(
                  left: 140,
                  top: 390,
                  child: Image.asset(AppImages.poster7), //7
                ),
                Positioned(
                  top: 240,
                  child: Image.asset(AppImages.ellipse), //E
                ),
                Positioned(
                  top: 320,
                  child: Image.asset(AppImages.shadow), //s
                ),
              ],
            ),
          ),
          Image.asset(
            AppImages.huluLogo,
            width: 120,
            fit: BoxFit.fill,
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
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
