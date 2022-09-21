// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Image _$$_ImageFromJson(Map<String, dynamic> json) => _$_Image(
      medium: json['medium'] ?? '',
      original: json['original'] ?? '',
    );

Map<String, dynamic> _$$_ImageToJson(_$_Image instance) => <String, dynamic>{
      'medium': instance.medium,
      'original': instance.original,
    };

_$_Schedule _$$_ScheduleFromJson(Map<String, dynamic> json) => _$_Schedule(
      time: json['time'] as String,
      days: (json['days'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_ScheduleToJson(_$_Schedule instance) =>
    <String, dynamic>{
      'time': instance.time,
      'days': instance.days,
    };
