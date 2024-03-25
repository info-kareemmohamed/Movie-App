import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/app/styles/icon_broken.dart';
import 'package:flutter_project/core/helper/firebase.dart';
import 'package:flutter_project/core/model/app_data.dart';
import 'package:flutter_project/core/model/main_user.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/app_layout/cubit/app_layout_cubit.dart';
import 'package:flutter_project/features/settings/cubit/settings_cubit.dart';
import 'package:flutter_project/features/settings/cubit/settings_states.dart';
import 'package:flutter_project/features/settings/view/flutter_switch_button.dart';
import 'package:flutter_project/generated/l10n.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppData.instance.Theme,
          appBar: AppBar(
            backgroundColor: AppData.instance.Theme,
            centerTitle: true,
            title: Text(
              S.of(context).settings_settings,
              style: AppTextStyle.extraBold(
                color: AppData.textColor(),
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
                      Container(
                        height: 200,
                        width: 130,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                UserMain.instance!.profilePicture ?? ""),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).settings_profile,
                            style: AppTextStyle.medium(
                              color: AppData.textColor(),
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            height: 35,
                            width: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                              child: Text(
                                UserMain.instance?.name ?? "",
                                textAlign: TextAlign.center,
                                style: AppTextStyle.semiBold(
                                  color: AppData.textColorName(),
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            S.of(context).settings_language,
                            style: AppTextStyle.medium(
                              color: AppData.textColor(),
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 40,
                            width: 190,
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color:
                                  AppData.instance.Theme == AppColors.darkTheme
                                      ? AppColors.darkGray
                                      : AppColors.lightYellow,
                            ),
                            child: DropdownButton(
                              items: context.read<SettingsCubit>().dropDownMenu(
                                  S.of(context).settings_ar,
                                  S.of(context).settings_en),
                              icon: Icon(
                                IconBroken.Arrow___Right_2,
                                size: 20,
                                color: AppData.textColor(),
                              ),
                              borderRadius: BorderRadius.circular(15),
                              dropdownColor:
                                  AppColors.darkTheme.withOpacity(0.8),
                              underline: const SizedBox(),
                              hint: Text(
                                context.read<SettingsCubit>().selectedValue,
                                style: AppTextStyle.regular(
                                  color: AppData.textColor(),
                                  fontSize: 11,
                                ),
                              ),
                              value:
                                  context.read<SettingsCubit>().selectedValue,
                              style: AppTextStyle.regular(
                                fontSize: 11,
                                color: AppData.textColor(),
                              ),
                              isExpanded: true,
                              onChanged: (String? value) {
                                context.read<SettingsCubit>().dropValue(value);
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
                        type: S.of(context).settings_mode,
                        options: S.of(context).settings_light_dark,
                        activeIcon: Icons.dark_mode_sharp,
                        inActiveIcon: Icons.sunny,
                        onToggle: ((value) {
                          context.read<SettingsCubit>().changeMode();
                        }),
                        value: context.read<SettingsCubit>().isDark,
                      ),
                      FlutterSwitchButton(
                        type: S.of(context).settings_notification,
                        options: S.of(context).settings_allow_notification,
                        onToggle: ((value) {
                          context.read<SettingsCubit>().allowNotification();
                        }),
                        value: context.read<SettingsCubit>().isAllow,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      context.read<AppLayoutCubit>().currentIndex = 1;
                      await FirebaseHelper.signOut();
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
                          S.of(context).settings_logout,
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
  }
}
