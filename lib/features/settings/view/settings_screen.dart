import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/app/styles/icon_broken.dart';
import 'package:flutter_project/core/helper/firebase.dart';
import 'package:flutter_project/core/helper/navigation.dart';
import 'package:flutter_project/core/model/app_data.dart';
import 'package:flutter_project/core/model/main_user.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_routes.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/app_layout/cubit/app_layout_cubit.dart';
import 'package:flutter_project/features/settings/cubit/settings_cubit.dart';
import 'package:flutter_project/features/settings/cubit/settings_states.dart';
import 'package:flutter_project/features/settings/view/flutter_switch_button.dart';
import 'package:flutter_project/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              S.of(context).settings_settings,
              style: AppTextStyle.extraBold(
                color: AppData.textColorNameToBase(),
                fontSize: 18.74.sp,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 200.h,
                            width: 130.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: getImageProfilePicture(),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              NavigationHelper.navigateTo(
                                  AppRoute.PROFILEPICTURE);
                            },
                            icon: const Icon(
                              IconBroken.Edit_Square,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).settings_profile,
                            style: AppTextStyle.medium(
                              color: AppData.textColorNameToBase(),
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Container(
                            height: 35.h,
                            width: 180.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r)),
                            child: Center(
                              child: Text(
                                UserMain.instance?.name ?? "",
                                textAlign: TextAlign.center,
                                style: AppTextStyle.semiBold(
                                  color: AppData.textColorNameToBase(),
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25.h),
                          Text(
                            S.of(context).settings_language,
                            style: AppTextStyle.medium(

                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            height: 40.h,
                            width: 190.w,
                            padding: EdgeInsets.symmetric(horizontal: 7.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
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
                                size: 20.sp,
                                color: AppData.textColorNameToBase(),
                              ),
                              borderRadius: BorderRadius.circular(15.r),
                              dropdownColor:
                                  AppData.instance.Theme.withOpacity(0.8),
                              underline: const SizedBox(),
                              hint: Text(
                                context.read<SettingsCubit>().selectedValue,
                                style: AppTextStyle.regular(
                                  color: AppData.textColorNameToBase(),
                                  fontSize: 11.sp,
                                ),
                              ),
                              value:
                                  context.read<SettingsCubit>().selectedValue,
                              style: AppTextStyle.regular(
                                fontSize: 11.sp,
                                color: AppData.textColorNameToBase(),
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
                      height: 45.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(34.r),
                      ),
                      child: Center(
                        child: Text(
                          S.of(context).settings_logout,
                          style: AppTextStyle.semiBold(
                            color: AppColors.darkTheme,
                            fontSize: 17.sp,
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

  ImageProvider<Object> getImageProfilePicture() {
    String? image = UserMain.instance!.profilePicture;
    return image == null || image.isEmpty
        ? const AssetImage(AppImages.profileImage1)
        : image.contains('assets')
            ? AssetImage(image)
            : CachedNetworkImageProvider(image) as ImageProvider<Object>;
  }
}
