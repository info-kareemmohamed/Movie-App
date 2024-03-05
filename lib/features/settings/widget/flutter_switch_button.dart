import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

class FlutterSwitchButton extends StatelessWidget {
  FlutterSwitchButton(
      {super.key,
      required this.type,
      required this.options,
      this.activeIcon,
      this.inActiveIcon,
      required this.value,
      required this.onToggle});

  String type;
  String options;
  IconData? activeIcon;
  IconData? inActiveIcon;
  bool value;
  ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            type,
            style: AppTextStyle.medium(
              color: AppColors.white,
              fontSize: 16.19.sp,
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            height: 56.h,
            width: 334.w,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
              color: AppColors.darkGray,
              borderRadius: BorderRadius.circular(5.51.w),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  options,
                  style: AppTextStyle.regular(
                    color: AppColors.lightYellow,
                    fontSize: 13.4.sp,
                  ),
                ),
                FlutterSwitch(
                  activeToggleColor:
                      activeIcon != null ? AppColors.darkGray : AppColors.white,
                  activeIcon: Icon(
                    activeIcon,
                    color: AppColors.white,
                  ),
                  activeColor: activeIcon != null
                      ? AppColors.lightRed
                      : AppColors.primary,
                  inactiveIcon: Icon(
                    inActiveIcon,
                    color: AppColors.lightRed,
                  ),
                  width: 50.w,
                  height: 30.h,
                  value: value,
                  onToggle: onToggle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
