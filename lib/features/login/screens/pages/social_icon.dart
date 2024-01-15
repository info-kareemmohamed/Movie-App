import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';

class SocalIcon extends StatelessWidget {
  final String? iconSrc;
  final Function? press;
  const SocalIcon({
    Key? key,
    this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.black87,
          border: Border.all(
            width: 2,
            color: AppColors.darkTheme,
          ),
          borderRadius: BorderRadius.circular(15.0),
          shape: BoxShape.rectangle,
        ),
        child: SvgPicture.asset(
          iconSrc!,
          color: Colors.white,
          height: 22,
          width: 24,
        ),
      ),
    );
  }
}
