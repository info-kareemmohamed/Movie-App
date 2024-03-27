import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteIconDelete extends StatelessWidget {
  FavouriteIconDelete({super.key, required this.onPressed});

  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.delete,
        size: 30.sp,
        color: Colors.red,
      ),
    );
  }
}
