import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/navigation.dart';
import '../../../core/utils/app_routes.dart';

class ProfilePictureContainer extends StatelessWidget {
  ProfilePictureContainer(
      {super.key, required this.image, required this.color, this.top = 40});

  int color;
  String image;
  double top;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      child: GestureDetector(
        onTap: () {
          FirebaseFirestore.instance
              .collection('Users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .update({'profilePicture': image}).then((value) =>
                  NavigationHelper.navigateToReplacement(AppRoute.APP_LAYOUT));
        },
        child: Container(
          height: 200.h,
          width: 130.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
            ),
          ),
        ),
      ),
    );
  }
}
