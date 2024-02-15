import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/app/styles/icon_broken.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/app_layout/cubit/app_layout_cubit.dart';
import 'package:flutter_project/features/login/screens/pages/login.dart';
import 'package:flutter_project/features/login/screens/widget/profile_picture_container.dart';
import 'package:flutter_project/features/settings/widget/flutter_switch_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
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
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProfilePictureContainer(
                              color: snapshot.data?['colorBackground'] ??
                                  0xFF1CE783,
                              top: snapshot.data?['profilePicture'] ==
                                      'assets/images/pi_4.png'
                                  ? 60
                                  : 40,
                              image: snapshot.data?['profilePicture'] ??
                                  'assets/images/pi_1.png',
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Profile',
                                  style: AppTextStyle.medium(
                                    color: AppColors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Container(
                                  height: 35,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Center(
                                    child: Text(
                                      context
                                                  .read<AppLayoutCubit>()
                                                  .selectedValue ==
                                              'Arabic'
                                          ? "الاسم بالعربي"
                                          : snapshot.data?['name'] ?? "",
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.semiBold(
                                        color: AppColors.darkTheme,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                Text(
                                  'App Language',
                                  style: AppTextStyle.medium(
                                    color: AppColors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  height: 40,
                                  width: 190,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 7),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: AppColors.lightRed,
                                  ),
                                  child: DropdownButton(
                                    items: context
                                        .read<AppLayoutCubit>()
                                        .dropMenuItems,
                                    icon: const Icon(
                                      IconBroken.Arrow___Right_2,
                                      size: 20,
                                      color: AppColors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    dropdownColor:
                                        AppColors.darkTheme.withOpacity(0.8),
                                    underline: const SizedBox(),
                                    hint: Text(
                                      context
                                          .read<AppLayoutCubit>()
                                          .selectedValue,
                                      style: AppTextStyle.regular(
                                        color: AppColors.white,
                                        fontSize: 11,
                                      ),
                                    ),
                                    value: context
                                        .read<AppLayoutCubit>()
                                        .selectedValue,
                                    style: AppTextStyle.regular(
                                      fontSize: 11,
                                      color: AppColors.white,
                                    ),
                                    isExpanded: true,
                                    onChanged: (String? value) {
                                      context
                                          .read<AppLayoutCubit>()
                                          .dropValue(value);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            FlutterSwitchButton(
                              type: 'Mode',
                              options: 'Light & Dark Mode',
                              activeIcon: Icons.dark_mode_sharp,
                              inActiveIcon: Icons.sunny,
                              onToggle: ((value) {
                                context.read<AppLayoutCubit>().changeMode();
                              }),
                              value: context.read<AppLayoutCubit>().isDark,
                            ),
                            FlutterSwitchButton(
                              type: 'Allow Notification',
                              options: 'Light & Dark Mode',
                              onToggle: ((value) {
                                context
                                    .read<AppLayoutCubit>()
                                    .allowNotification();
                              }),
                              value: context.read<AppLayoutCubit>().isAllow,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () async {
                            context.read<AppLayoutCubit>().currentIndex = 1;
                            await FirebaseAuth.instance.signOut().then(
                                (value) => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()),
                                    (route) => false));
                          },
                          child: Container(
                            height: 45,
                            width: 200,
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
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
