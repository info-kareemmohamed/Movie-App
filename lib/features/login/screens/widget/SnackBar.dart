import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String? message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Center(
        child: Text(
      message!,
      textAlign: TextAlign.center,
    )),
    backgroundColor: color,
    duration: const Duration(milliseconds: 2000),
  ));
}
