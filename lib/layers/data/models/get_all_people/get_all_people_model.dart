// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:sqin_task/layers/data/models/image_model.dart';
//
// part 'get_all_people_model.freezed.dart';
// part 'get_all_people_model.g.dart';
//
//
// @freezed
// class PeopleModel with _$PeopleModel{
//   //const AllSeriesModel._();
//
//   factory PeopleModel({
//     required int id,
//     required String name,
//     required dynamic birthday,
//     required String gender,
//     required Image image,
//
//   })= _PeopleModel;
//
//
//   factory PeopleModel.fromJson(Map<String, dynamic> json) =>
//       _$PeopleModelFromJson(json);
// }
//


import 'package:sqin_task/layers/data/models/image_model/image_model.dart';

class PersonBasicInfoEntity {
  final int id;
  final String name;
  final String birthday;
  final String deathday;
  final String gender;
  final Image image;

  const PersonBasicInfoEntity({
    required this.id,
    required this.name,
    required this.birthday,
    required this.deathday,
    required this.gender,
    required this.image,
  });
}

class PeopleModel extends PersonBasicInfoEntity {
  final int dtoId;
  final String dtoName;
  final String dtoBirthday;
  final String dtoDeathday;
  final String dtoGender;
  final Image imageModel;

  PeopleModel({
    required this.dtoId,
    required this.dtoName,
    required this.dtoBirthday,
    required this.dtoDeathday,
    required this.dtoGender,
    required this.imageModel,
  }) : super(
    id: dtoId,
    name: dtoName,
    birthday: dtoBirthday,
    deathday: dtoDeathday,
    gender: dtoGender,
    image: imageModel,
  );

  factory PeopleModel.fromMap(Map<String, dynamic> map) {
    return PeopleModel(
      dtoId: (map['id'] ?? ''),
      dtoName: (map['name'] ?? '').toString(),
      dtoBirthday: (map['birthday'] ?? '').toString(),
      dtoDeathday: (map['deathday'] ?? '').toString(),
      dtoGender: (map['gender'] ?? '').toString(),
      imageModel: Image.fromJson(map['image'] ?? {},),
    );
  }
}
