import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/app_layout/screens/app_layout_screen.dart';

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
              .update({'profilePicture': image, 'colorBackground': color}).then(
            (value) => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const AppLayoutScreen()),
              (route) => false,
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              height: 200,
              width: 130,
              decoration: BoxDecoration(
                color: Color(color),
                borderRadius: BorderRadius.circular(7.15),
              ),
            ),
            Positioned(
              top: top,
              child: Image.asset(image),
            ),
          ],
        ),
      ),
    );
  }
}
