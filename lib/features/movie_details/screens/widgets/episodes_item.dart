import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/movie_details/data/models/movie_episodes_details_model.dart';

class EpisodesItem extends StatelessWidget {
  EpisodesItem({super.key, required this.model});

  MovieDetailsModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 130,
          decoration: BoxDecoration(
              color: Colors.yellowAccent,
              borderRadius: BorderRadius.circular(2)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title ?? 'Not Found',
                style: AppTextStyle.medium(
                  decoration: TextDecoration.underline,
                  color: AppColors.lightYellow,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                width: 190,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    model.subTitle ?? 'Not Found',
                    style: AppTextStyle.medium(
                      color: Colors.white,
                      fontSize: 9,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: Colors.yellow,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    model.rate.toString() ?? 'Not Found',
                    style: AppTextStyle.medium(
                        color: Colors.white, decoration: TextDecoration.none),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Rate',
                    style: AppTextStyle.regular(
                      color: AppColors.green,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Download');
                    },
                    child: Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.primary,
                          width: 2.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.file_download_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Download',
                              style: AppTextStyle.semiBold(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
