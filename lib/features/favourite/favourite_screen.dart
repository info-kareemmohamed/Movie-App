import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_text_style.dart';
import 'cubit/FavouriteMovieCubit.dart';
import 'cubit/FavouriteMovieState.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteMovieCubit, FavouriteMovieStates>(
      builder: (context, state) {
        if (state is FavouriteMovieSuccessState) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Sorry Not Found',
                style: AppTextStyle.semiBold(
                  color: Colors.red,
                  fontSize: 25,
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: AppColors.darkTheme,
            appBar: AppBar(
              backgroundColor: AppColors.darkTheme,
              centerTitle: true,
              title: Text(
                'Favourite',
                style: AppTextStyle.extraBold(
                  color: Colors.white,
                  fontSize: 18.74,
                ),
              ),
            ),
            body: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                'https://movies.universalpictures.com/media/06-opp-dm-mobile-banner-1080x745-now-pl-f01-071223-64bab982784c7-1.jpg'),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 190,
                                child: const Text(
                                  "Namefssidgmismdgmdgimdfigmigm",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Comedy',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Movie',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              size: 30,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }

  Widget _buildRowList() {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://resizing.flixster.com/dV1vfa4w_dB4wzk7A_VzThWUWw8=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzEyZDMyYjZmLThmNzAtNDliNC1hMjFmLTA2ZWY4M2UyMjJhMi5qcGc='),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(children: [
                    Text(
                      'oppenheimer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '2023 Total of 4,25GB',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 100),
                      child: Text(
                        'Movie',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    width: 0,
                  ),
                  Column(
                    children: [
                      ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white)),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_arrow_outlined,
                          color: Colors.black,
                        ),
                        label: const Text(
                          'Show',
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ),
                      ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red)),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Delete',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
