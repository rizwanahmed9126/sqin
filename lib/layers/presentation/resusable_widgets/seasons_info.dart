import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/seasons_details/seasons_details_model.dart';
import 'episode_card.dart';

class SeasonsInfoWidget extends StatelessWidget {
  final List<SeasonEntity> seasons;
  //final void Function({required EpisodesDataModel episode}) episodeOnTapAction;

  const SeasonsInfoWidget({
    Key? key,
    required this.seasons,
    // required this.episodeOnTapAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (seasons.isEmpty) {
      return const SizedBox();
    }

    final buildSeasonsInfo = seasons
        .map((item) => buildSeasonComponent(context, season: item))
        .toList();

    return Column(
      children: buildSeasonsInfo,
    );
  }

  Widget buildSeasonComponent(BuildContext context,
      {required SeasonEntity season}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Season ${season.number}',
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
          height: 150.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: season.episodes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 16 : 0,
                  right: index == season.episodes.length - 1 ? 16 : 0,
                ),
                child: EpisodeCard(
                  episode: season.episodes[index],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 8,
              );
            },
          ),
        )
      ],
    );
  }
}
