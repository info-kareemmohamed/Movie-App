import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';

class SecondOnBoardingScreen extends StatelessWidget {
  const SecondOnBoardingScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 90.0),
        child: Column(
          children: [
            Image.asset(AppImages.huluLogo),
            const SizedBox(
              height: 35,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: -30,
                  child: Image.asset(
                    AppImages.poster4,
                  ),
                ),
                Positioned(
                  left: 35.0,
                  child: Image.asset(
                    AppImages.poster5,
                  ),
                ),
                Positioned(
                  right: -35,
                  child: Image.asset(
                    AppImages.poster3,
                  ),
                ),
                Positioned(
                  right: 45.0,
                  child: Image.asset(
                    AppImages.poster2,
                  ),
                ),
                Center(
                  child: Image.asset(
                    AppImages.poster,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 62,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Unlimited\n',
                    style: AppTextStyle.black(
                      fontSize: 33.01,
                      color: AppColors.primary,
                    ),
                  ),
                  const WidgetSpan(
                    child: SizedBox(height: 30),
                  ),
                  TextSpan(
                    text: 'movies, TV shows & More... \n',
                    style: AppTextStyle.black(
                      fontSize: 18.29,
                    ),
                  ),
                  const WidgetSpan(
                    child: SizedBox(height: 35),
                  ),
                  TextSpan(
                    text: 'Watch anywhere, cancel\nanytime.',
                    style: AppTextStyle.medium(
                      fontSize: 13.3,
                      color: AppColors.lightYellow,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
