import 'package:flutter/material.dart';

class FavouriteIconDelete extends StatelessWidget {
  FavouriteIconDelete({super.key, required this.onPressed});

  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.delete,
        size: 30,
        color: Colors.red,
      ),
    );
  }
}
