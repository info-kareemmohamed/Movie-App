import 'package:flutter/material.dart';

class Trailers extends StatelessWidget {
  const Trailers({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: List.generate(
            3,
            (index) => Container(
              height: 155,
              width: 232,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(5),
              ),
              margin: const EdgeInsets.all(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
