import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/features/movie_details/screens/details_screen.dart';

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
            5,
            (rowIndex) => Row(
              children: List.generate(
                2,
                (index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieDetails(id: "Movi")));
                  },
                  child: Container(
                    height: 200,
                    width: 133,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(AppImages.poster),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(10),
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
      ),
    );
  }
}
