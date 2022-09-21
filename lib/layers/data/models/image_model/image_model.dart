
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_model.freezed.dart';
part 'image_model.g.dart';

@freezed
class Image with _$Image{
  //const Image._();
  factory Image({
    required String medium,
    required String original,
  })= _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

}




@freezed
class Schedule with _$Schedule{
  //const Image._();
  factory Schedule({
    required String time,
    required List<String> days,
  })= _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);

}

