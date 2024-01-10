import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';

class ThirdOnBoardingScreen extends StatelessWidget {
  const ThirdOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var onBoardingController = PageController();
    return Column(
      children: [
        Center(
          child: Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 96, left: 35),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'DOWNLOAD\n',
                          style: AppTextStyle.black(
                            fontSize: 49.56,
                            color: AppColors.primary,
                          ),
                        ),
                        TextSpan(
                          text: 'SHOWS\n',
                          style: AppTextStyle.black(
                            fontSize: 49.56,
                          ),
                        ),
                        TextSpan(
                          text: '& MOVIES',
                          style: AppTextStyle.black(
                            fontSize: 49.56,
                          ),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 255),
                child: Center(child: Image.asset(AppImages.iphoneImage)),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text('''Always have something
         to watch offline ''',
            style: AppTextStyle.medium(
              fontSize: 11.44,
              color: AppColors.secondary,
            )),
      ],
    );
  }
}
