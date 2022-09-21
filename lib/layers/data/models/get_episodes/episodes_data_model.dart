import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sqin_task/layers/data/models/image_model/image_model.dart';

part 'episodes_data_model.freezed.dart';
part 'episodes_data_model.g.dart';


@freezed
class EpisodesDataModel with _$EpisodesDataModel{
  //const AllSeriesModel._();

  factory EpisodesDataModel({
    required int id,
    required String name,
    required int season,
    required int number,
    required String summary,
    required Image image,



  })= _EpisodesDataModel;


  factory EpisodesDataModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodesDataModelFromJson(json);
}

