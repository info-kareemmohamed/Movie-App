import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/helper/navigation.dart';
import '../../../core/utils/app_routes.dart';
import '../../app_layout/screens/app_layout_screen.dart';

class ProfilePictureContainer extends StatelessWidget {
  ProfilePictureContainer(
      {super.key, required this.image, required this.color, this.top = 40});

  int color;
  String image;
  double top;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          FirebaseFirestore.instance
              .collection('Users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .update({'profilePicture': image}).then(
            (value) => NavigationHelper.navigateToReplacement(AppRoute.APP_LAYOUT)

          );
        },
        child: Container(
          height: 200,
          width: 130,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
            ),
            // image: DecorationImage(
            //   image: CachedNetworkImageProvider(image),
            // ),
          ),
        ),
      ),
    );
  }
}
