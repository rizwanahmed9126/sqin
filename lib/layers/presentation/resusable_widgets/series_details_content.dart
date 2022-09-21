import 'package:flutter/material.dart';

import '../../data/models/seasons_details/seasons_details_model.dart';
import 'genres_widget.dart';

class SeriesDetailsContent extends StatelessWidget {
  final SeasonsDetailsModel seriesDetails;
  const SeriesDetailsContent({Key? key, required this.seriesDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            seriesDetails.name,
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 8,
          ),
          GenresInfoWidget(genres: seriesDetails.genres),
          const SizedBox(
            height: 8,
          ),

          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
