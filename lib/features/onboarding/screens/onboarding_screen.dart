import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:flutter_project/features/onboarding/screens/lo.dart';
import 'package:flutter_project/features/onboarding/screens/widgets/fourth_onboarding_screen.dart.dart';
import 'package:flutter_project/features/onboarding/screens/widgets/second_onboarding_screen.dart.dart';
import 'package:flutter_project/features/onboarding/screens/widgets/third_onboarding_screen.dart.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../login/screens/pages/login.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController onBoardingController = PageController();

    var cubit = context.read<OnboardingCubit>();

    List<Widget> screens = [
      const SecondOnBoardingScreen(),
      const ThirdOnBoardingScreen(),
      const FourthOnBoardingScreen(),
    ];

    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) => screens[index],
                  itemCount: screens.length,
                  physics: const NeverScrollableScrollPhysics(),
                  controller: onBoardingController,
                  onPageChanged: (index) {
                    if (index == screens.length - 1) {
                      cubit.isLastScreen = true;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10.0,
                  left: 25,
                  right: 25,
                ),
                child: Row(
                  children: [
                    SmoothPageIndicator(
                      controller: onBoardingController,
                      count: screens.length,
                      effect: const ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        dotHeight: 5,
                        dotWidth: 5,
                        expansionFactor: 4.5,
                        spacing: 4,
                        activeDotColor: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        cubit.isLastScreen
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()))
                            : cubit.nextPage(onBoardingController);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.primary,
                        ),
                        height: 65,
                        width: 65,
                        child: const Icon(
                          Icons.arrow_forward_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
