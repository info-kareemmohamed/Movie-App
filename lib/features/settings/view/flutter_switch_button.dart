import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
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
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            type,
            style: AppTextStyle.medium(
              color: AppColors.white,
              fontSize: 16.19,
            ),
          ),
          SizedBox(height: 12),
          Container(
            height: 56,
            width: 334,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: AppColors.darkGray,
              borderRadius: BorderRadius.circular(5.51),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  options,
                  style: AppTextStyle.regular(
                    color: AppColors.lightYellow,
                    fontSize: 13.4,
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
                  width: 50,
                  height: 30,
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
