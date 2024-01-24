import 'package:flutter/material.dart';

void showSnackBar(BuildContext context,String? message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(message!)),
        backgroundColor: color,
        duration: Duration(milliseconds: 1000),
      )
  );
}
