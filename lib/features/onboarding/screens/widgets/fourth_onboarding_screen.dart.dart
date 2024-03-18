import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';

class FourthOnBoardingScreen extends StatelessWidget {
  const FourthOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.0, top: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'PARTY MODE\n',
                  style: AppTextStyle.black(
                    fontSize: 33.94,
                    color: AppColors.primary,
                  ),
                ),
                TextSpan(
                  text: 'is now Live',
                  style: AppTextStyle.black(
                    fontSize: 33.94,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 13),
            child: Container(
              height: 200,
              width: 282,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.darkBlue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 85,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 40,
                          top: 25,
                          child: CircleAvatar(
                            radius: 12.5,
                            backgroundColor: AppColors.lightRed,
                            child: Icon(
                              Icons.visibility_outlined,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          top: 25,
                          child: CircleAvatar(
                            radius: 12.5,
                            child: Image.asset(
                              AppImages.avatar,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'YOUR\nPARTY\n',
                            style: AppTextStyle.semiBold(
                              fontSize: 17.67,
                            ),
                          ),
                          TextSpan(
                            text: 'Still Requesting\n',
                            style: AppTextStyle.light(
                              fontSize: 8.83,
                              color: AppColors.lightRed,
                            ),
                          ),
                          TextSpan(
                            text: 'None',
                            style: AppTextStyle.light(
                              fontSize: 8.83,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 13.0),
                      child: Container(
                        height: 25,
                        width: 89,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'Request',
                            style: AppTextStyle.semiBold(
                              fontSize: 9.84,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 22,
          ),
          Padding(
            padding: EdgeInsets.only(left: 70),
            child: Container(
              height: 200,
              width: 282,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.darkBlue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 85,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 20,
                          top: 25,
                          child: CircleAvatar(
                            radius: 12.5,
                            child: Image.asset(
                              AppImages.avatar,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 40,
                          top: 25,
                          child: CircleAvatar(
                            radius: 12.5,
                            child: Image.asset(
                              AppImages.avatar2,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 60,
                          top: 25,
                          child: CircleAvatar(
                            radius: 12.5,
                            child: Image.asset(
                              AppImages.avatar3,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 80,
                          top: 25,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: const Color(0XFF111928),
                              child: Text(
                                '+20',
                                style: AppTextStyle.medium(
                                  fontSize: 8.67,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'FRIEND’S\nPARTY\n',
                              style: AppTextStyle.semiBold(
                                fontSize: 17.67,
                              ),
                            ),
                            TextSpan(
                              text: 'Watching OPPENHEIMER\n',
                              style: AppTextStyle.light(
                                fontSize: 8.83,
                                color: AppColors.lightRed,
                              ),
                            ),
                            TextSpan(
                              text: ' 34min in ',
                              style: AppTextStyle.light(
                                fontSize: 8.83,
                              ),
                            ),
                          ],
                        ),
                      )),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 13.0),
                      child: Container(
                        height: 25,
                        width: 67,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.primary,
                        ),
                        child: Center(
                          child: Text(
                            'Join',
                            style: AppTextStyle.medium(
                              fontSize: 11.81,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 45),
            child: RichText(
              text: TextSpan(
                style: AppTextStyle.medium(
                  fontSize: 11.44,
                  color: AppColors.lightYellow,
                ),
                children: const [
                  TextSpan(
                    text: 'Enjoy watching your Favorite movies & shows\n',
                  ),
                  TextSpan(
                    text: 'with your friends using ',
                  ),
                  TextSpan(
                    text: 'Party Mode',
                    style: TextStyle(
                      color: AppColors.primary,
                    ),
                  ),
                  TextSpan(
                    text: '\nparty holds up to 20',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
