import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../data/models/get_all_series/all_series_model.dart';
import '../../data/models/get_all_people/get_all_people_model.dart';
import '../pages/all_people_screen.dart';
import '../pages/listing_page.dart';
import '../pages/season_details.dart';
import 'image_widget.dart';

Widget dataGridview({required ScrollController controller, required List<PeopleModel> list}) {
  return RepaintBoundary(
    child: MasonryGridView.count(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 24,
      crossAxisSpacing: 16,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: index == 0 || index == 1 ? 32 : 0),
          child: InkWell(
            onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>SeasonDetails(id: list[index].id,url: list[index].image.original,)));

            },//() => onTap(seriesEntity: seriesInfoItem),
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
                      tag: 'home${list[index].id}',
                      child: ImageWidget(
                        imageNetworkPath: list[index].image.medium,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(list[index].name,
                    style:const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 8,
                ),

              ],
            ),
          ),
        );
      },
    ),
  );
}
