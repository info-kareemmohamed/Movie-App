import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';

class SliverAppbar extends StatelessWidget {
  const SliverAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Tab> myTabs = [
      Tab(child: Text('EPISODES', style: AppTextStyle.medium(fontSize: 16))),
      Tab(child: Text('TRAILERS', style: AppTextStyle.medium(fontSize: 16))),
      Tab(child: Text('CASTS', style: AppTextStyle.medium(fontSize: 16))),
    ];
    return SliverAppBar(
      leadingWidth: 88,
      leading: Padding(
        padding: const EdgeInsets.only(left: 35, top: 5, bottom: 3.5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.primary.withOpacity(0.8),
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      backgroundColor: AppColors.darkTheme,
      collapsedHeight: 450,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Stack(
          children: [
            Image.asset(
              AppImages.poster14,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
              left: 130,
              top: 150,
              child: RichText(
                text: TextSpan(
                  style: AppTextStyle.black(
                    color: AppColors.lightYellow,
                    fontSize: 45,
                  ),
                  children: const [
                    TextSpan(
                      text: 'LO',
                    ),
                    TextSpan(
                      text: 'KI',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottom: TabBar(
        indicatorColor: AppColors.green,
        dividerColor: AppColors.darkTheme,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: AppColors.lightYellow,
        tabs: myTabs,
      ),
    );
  }
}
