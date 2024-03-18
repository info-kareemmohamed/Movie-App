import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/core/helper/navigation.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/utils/app_routes.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/profile_picture/view/profile_picture_container.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/model/main_user.dart';
import '../../../generated/l10n.dart';

class ProfilePictureAdd extends StatelessWidget {
  const ProfilePictureAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: 130,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightRed),
                  borderRadius: BorderRadius.circular(7.15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.darkBlue,
                      child: IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: AppColors.lightYellow,
                          size: 25,
                        ),
                        onPressed: () {
                          uploadImage();
                          NavigationHelper.navigateToReplacement(AppRoute.APP_LAYOUT);
                          print('add');
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                    S.of(context).profile_addprofile,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.medium(
                        color: AppColors.lightYellow,
                        fontSize: 11.05,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ProfilePictureContainer(
              color: 0xFFFF1422,
              image: AppImages.profileImage1,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfilePictureContainer(
              color: 0xFF1CE783,
              image: AppImages.profileImage2,
            ),
            ProfilePictureContainer(
              color: 0xFF706EF1,
              image: AppImages.profileImage3,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfilePictureContainer(
              color: 0xFF00B6EF,
              image: AppImages.profileImage4,
              top: 60,
            ),
            ProfilePictureContainer(
              color: 0xFFFF7EA8,
              image: AppImages.profileImage5,
            ),
          ],
        ),
      ],
    );
  }

  Future<void> uploadImage() async {
    File? file = await _pickImage();
    if (file != null) {
      UploadTask task = FirebaseStorage.instance
          .ref()
          .child('${UserMain.instance!.id}.png')
          .putFile(file!);
      UserMain.instance!.profilePicture =
          await task.snapshot.ref.getDownloadURL();
    } else {
      print('no');
    }
  }

  Future<File?> _pickImage() async {
    ImagePicker picker = ImagePicker();
    XFile? xfile = await picker.pickImage(source: ImageSource.gallery);
    if (xfile != null) {
      File file = File(xfile.path);
      print("YES");
      return file;
    }
    print("NO");
    return null;
  }
}
