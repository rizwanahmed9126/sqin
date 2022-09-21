import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/seasons_details/seasons_details_model.dart';
import '../pages/all_people_screen.dart';
import '../pages/episode_detail_screen.dart';
import 'image_widget.dart';

class EpisodeCard extends StatelessWidget {
  final EpisodeModel episode;
  const EpisodeCard({
    Key? key,
    required this.episode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>EpisodeDetailsPage(episode: episode,)));

        },

        //onTap: () => action(episode: episode),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              child: Container(
                height: 120.h,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: Hero(
                  tag: '${episode.id}${episode.name}',
                  child: ImageWidget(imageNetworkPath: episode.image.medium),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Flexible(
              child: Text(
                'S${episode.seasonNumber}E${episode.number} ${episode.name}',
                style:const TextStyle(fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
