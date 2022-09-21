import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sqin_task/layers/data/models/image_model/image_model.dart';

part 'all_series_model.freezed.dart';
part 'all_series_model.g.dart';


@freezed
class AllSeriesModel with _$AllSeriesModel{
  //const AllSeriesModel._();

  factory AllSeriesModel({
    required int id,
    required String name,
    required List<String> genres,
   // required int runtime,
    //required int averageRuntime,
    //required String premiered,
    required Schedule schedule,
    required String summary,
    required Image image,



  })= _AllShowsModels;


  factory AllSeriesModel.fromJson(Map<String, dynamic> json) =>
      _$AllSeriesModelFromJson(json);
}

