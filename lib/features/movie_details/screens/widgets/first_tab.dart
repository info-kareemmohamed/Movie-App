import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_style.dart';
import 'package:flutter_project/features/movie_details/data/models/movie_episodes_details_model.dart';
import 'package:flutter_project/features/movie_details/screens/widgets/episodes_item.dart';
import 'package:readmore/readmore.dart';

class FirstTabScreen extends StatelessWidget {
  FirstTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 23.0, top: 23),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ReadMoreText(
              'The mercurial villain Loki resumes his role as the God of Mischief in a new series that takes place after the events of "Avengers: Endgame".',
              trimLines: 2,
              style: AppTextStyle.regular(
                fontSize: 12,
                color: AppColors.lightYellow,
              ),
              colorClickableText: AppColors.primary,
              trimMode: TrimMode.Line,
              trimCollapsedText: ' Read more',
              trimExpandedText: ' Read Less',
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverList.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 27,
            ),
            itemCount: episodesList.length,
            itemBuilder: (context, index) =>
                EpisodesItem(model: episodesList[index]),
          ),
        ],
      ),
    );
  }

  List<MovieDetailsModel> episodesList = [
    MovieDetailsModel(
      title: 'First Episodes',
      subTitle:
          'Mobius puts Loki to work, but not everyone at TVA is thrilled about the God of Mischief\'s presence.',
      rate: 8.6,
    ),
    MovieDetailsModel(
      title: 'Second Episodes',
      subTitle:
          'Mobius puts Loki to work, but not everyone at TVA is thrilled about the God of Mischief\'s presence.',
      rate: 1.6,
    ),
    MovieDetailsModel(
      title: 'Third Episodes',
      subTitle:
          'Mobius puts Loki to work, but not everyone at TVA is thrilled about the God of Mischief\'s presence.',
      rate: 5.6,
    ),
    MovieDetailsModel(
      title: 'Fourth Episodes',
      subTitle:
          'Mobius puts Loki to work, but not everyone at TVA is thrilled about the God of Mischief\'s presence.',
      rate: 4.6,
    ),
  ];
}
