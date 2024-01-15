import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/movie_details/data/models/movie_trailers_model.dart';

class MovieInfo extends StatelessWidget {
  MovieInfo({super.key, required this.model});

  TrailersModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Director\n',
                      style: AppTextStyle.medium(
                        color: AppColors.lightRed,
                        fontSize: 13.28,
                      ),
                    ),
                    TextSpan(
                      text: model.director ?? 'Not Found',
                      style: AppTextStyle.medium(
                        color: AppColors.lightYellow,
                        fontSize: 13.28,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Production Company\n',
                      style: AppTextStyle.medium(
                        color: AppColors.lightRed,
                        fontSize: 13.28,
                      ),
                    ),
                    TextSpan(
                      text: model.productionCompany ?? 'Not Found',
                      style: AppTextStyle.medium(
                        color: AppColors.lightYellow,
                        fontSize: 13.28,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Release Date\n',
                  style: AppTextStyle.medium(
                    color: AppColors.lightRed,
                    fontSize: 13.28,
                  ),
                ),
                TextSpan(
                  text: model.releaseDate ?? 'Not Found',
                  style: AppTextStyle.medium(
                    color: AppColors.lightYellow,
                    fontSize: 13.28,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Stars\n',
                  style: AppTextStyle.medium(
                    color: AppColors.lightRed,
                    fontSize: 13.28,
                  ),
                ),
                for (int i = 0; i < model.stars!.length; i++)
                  TextSpan(
                    text:
                        '${model.stars![i]}${i < model.stars!.length - 1 ? '\n' : ''}',
                    style: AppTextStyle.medium(
                      color: AppColors.lightYellow,
                      fontSize: 13.28,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
