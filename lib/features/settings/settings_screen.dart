import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/app_layout/cubit/app_layout_cubit.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AppLayoutCubit>();
    return BlocBuilder<AppLayoutCubit, AppLayoutStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.darkTheme,
          appBar: AppBar(
            backgroundColor: AppColors.darkTheme,
            centerTitle: true,
            title: Text(
              'Settings',
              style: AppTextStyle.extraBold(
                color: Colors.white,
                fontSize: 18.74,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 156.49,
                    width: 108,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.51),
                    ),
                  ),
                  Text(
                    'Mahmoud Abdelaty',
                    style: AppTextStyle.semiBold(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  Container(
                    height: 56,
                    width: 334,
                    decoration: BoxDecoration(
                      color: AppColors.lightRed,
                      borderRadius: BorderRadius.circular(5.51),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Language',
                          style: AppTextStyle.regular(
                            color: AppColors.lightYellow,
                            fontSize: 13.4,
                          ),
                        ),
                        FlutterSwitch(
                            activeText: '',
                            activeColor: Colors.black,
                            inactiveText: '',
                            width: 65,
                            height: 35,
                            padding: 6,
                            showOnOff: true,
                            value: cubit.isDark,
                            onToggle: ((value) {
                              cubit.changeMode();
                            })),
                      ],
                    ),
                  ),
                  Container(
                    height: 56,
                    width: 334,
                    decoration: BoxDecoration(
                      color: AppColors.lightRed,
                      borderRadius: BorderRadius.circular(5.51),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Light & Dark Mode',
                          style: AppTextStyle.regular(
                            color: AppColors.lightYellow,
                            fontSize: 13.4,
                          ),
                        ),
                        FlutterSwitch(
                            activeText: '',
                            activeIcon: const Icon(Icons.dark_mode_sharp),
                            activeColor: Colors.black,
                            inactiveText: '',
                            inactiveIcon: const Icon(Icons.sunny),
                            width: 65,
                            height: 35,
                            padding: 6,
                            showOnOff: true,
                            value: cubit.isDark,
                            onToggle: ((value) {
                              cubit.changeMode();
                            })),
                      ],
                    ),
                  ),

                  Container(
                    height: 50,
                    width: 193,
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(34),
                    ),
                    child: Center(
                      child: Text(
                        'Logout',
                        style: AppTextStyle.semiBold(
                          color: AppColors.darkTheme,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  // Mainbutton(
                  //   onTap: () {
                  //     FirebaseAuth.instance.signOut();
                  //     Navigator.pushAndRemoveUntil(
                  //         context,
                  //         MaterialPageRoute(builder: (context) => Login()),
                  //         (route) => false);
                  //     cubit.currentIndex = 1;
                  //   },
                  //   text: 'LogOut',
                  //   btnColor: AppColors.green,
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
