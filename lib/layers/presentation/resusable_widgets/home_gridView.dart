import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sqin_task/layers/presentation/resusable_widgets/series_card.dart';

import '../../data/models/get_all_series/all_series_model.dart';
import '../pages/all_people_screen.dart';
import '../pages/listing_page.dart';
import '../pages/season_details.dart';

Widget buildList({required ScrollController controller, required List<AllSeriesModel> list}) {
  return RepaintBoundary(
    child: MasonryGridView.count(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 24,
      crossAxisSpacing: 16,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return SeriesCard(
          key: ValueKey(index),
          heroTag: 'home${list[index].id}',
          index: index,
          seriesInfoItem: list[index],
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SeasonDetails(id: list[index].id,url: list[index].image.original,)));
          },
          // onTap: widget.presenter.goToSeriesDetailsPage,
        );
      },
    ),
  );
}
