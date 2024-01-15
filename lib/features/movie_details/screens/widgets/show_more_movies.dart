import 'package:flutter/material.dart';

class ShowMoreFilms extends StatelessWidget {
  const ShowMoreFilms({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: List.generate(
            10,
            (rowIndex) => Row(
              children: List.generate(
                2,
                (index) => Container(
                  height: 190,
                  width: 133,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 15,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
