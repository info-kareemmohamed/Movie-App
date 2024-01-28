import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/app_layout/cubit/app_layout_cubit.dart';
import 'package:flutter_project/features/login/screens/pages/login.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AppLayoutCubit>();
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          return BlocBuilder<AppLayoutCubit, AppLayoutStates>(
            builder: (context, state) {
              return Scaffold(
                backgroundColor: AppColors.darkTheme,
                appBar: AppBar(
                  backgroundColor: AppColors.darkTheme,
                  centerTitle: true,
                  title: Text(
                    'Settings',
                    style: AppTextStyle.extraBold(
                      color: Colors.white,
                      fontSize: 18.74,
                    ),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          snapshot.data?['name'] ?? "Not Found",
                          style: AppTextStyle.semiBold(
                            color: AppColors.primary,
                            fontSize: 25,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            cubit.currentIndex = 1;
                            await FirebaseAuth.instance.signOut().then(
                                (value) => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()),
                                    (route) => false));
                          },
                          child: Container(
                            height: 50,
                            width: 193,
                            decoration: BoxDecoration(
                              color: AppColors.green,
                              borderRadius: BorderRadius.circular(34),
                            ),
                            child: Center(
                              child: Text(
                                'Logout',
                                style: AppTextStyle.semiBold(
                                  color: AppColors.darkTheme,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
