// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_series_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AllShowsModels _$$_AllShowsModelsFromJson(Map<String, dynamic> json) =>
    _$_AllShowsModels(
      id: json['id'] as int,
      name: json['name'] as String,
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      schedule: Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
      summary: json['summary'] as String,
      image: Image.fromJson(json['image'] ?? {} as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AllShowsModelsToJson(_$_AllShowsModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'genres': instance.genres,
      'schedule': instance.schedule,
      'summary': instance.summary,
      'image': instance.image,
    };
