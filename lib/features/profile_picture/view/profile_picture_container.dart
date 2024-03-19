import 'package:flutter/material.dart';

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
          // FirebaseFirestore.instance
          //     .collection('Users')
          //     .doc(FirebaseAuth.instance.currentUser!.uid)
          //     .update({'profilePicture': image, 'colorBackground': color}).then(
          //   (value) => Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(builder: (context) => const AppLayoutScreen()),
          //     (route) => false,
          //   ),
          // );
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
