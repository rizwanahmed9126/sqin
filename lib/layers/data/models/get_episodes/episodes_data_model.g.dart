// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episodes_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EpisodesDataModel _$$_EpisodesDataModelFromJson(Map<String, dynamic> json) =>
    _$_EpisodesDataModel(
      id: json['id'] as int,
      name: json['name'] as String,
      season: json['season'] as int,
      number: json['number'] as int,
      summary: json['summary'] as String,
      image: Image.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EpisodesDataModelToJson(
        _$_EpisodesDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'season': instance.season,
      'number': instance.number,
      'summary': instance.summary,
      'image': instance.image,
    };
