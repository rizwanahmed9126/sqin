import 'package:flutter/material.dart';

import '../../data/models/get_all_series/all_series_model.dart';
import '../pages/all_people_screen.dart';
import 'image_widget.dart';

class SeriesCard extends StatelessWidget {
  final int index;
  final String heroTag;
  final AllSeriesModel seriesInfoItem;
  final VoidCallback onTap;
  const SeriesCard({
    Key? key,
    required this.index,
    required this.seriesInfoItem,
    required this.onTap,
    required this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: index == 0 || index == 1 ? 32 : 0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  //color: AppColors.grey1,
                  color: Colors.grey,
                ),
                child: Hero(
                  tag: heroTag,
                  child: ImageWidget(
                    imageNetworkPath: seriesInfoItem.image.medium,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(seriesInfoItem.name,
                style:const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 8,
            ),

          ],
        ),
      ),
    );
  }
}
