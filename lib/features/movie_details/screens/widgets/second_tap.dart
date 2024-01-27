import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_images.dart';

class SecondTabScreen extends StatelessWidget {
  const SecondTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Container(
              height: 155,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(AppImages.poster),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 40,
              ),
            ),
            childCount: 10,
          ),
        ),
      ],
    );
  }
}
