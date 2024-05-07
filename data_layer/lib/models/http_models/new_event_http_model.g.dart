// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_event_http_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewEventHttpModel _$NewEventHttpModelFromJson(Map<String, dynamic> json) =>
    NewEventHttpModel(
      name_event: json['name_event'] as String?,
      time_event: json['time_event'] == null
          ? null
          : DateTime.parse(json['time_event'] as String),
      plece_event: json['plece_event'] as String?,
      about_event: json['about_event'] as String?,
      price: (json['price'] as num?)?.toInt(),
      age_limit: (json['age_limit'] as num?)?.toInt(),
      image: json['image'] as String?,
      link: json['link'] as String?,
      name_category: json['name_category'] as String?,
    );

Map<String, dynamic> _$NewEventHttpModelToJson(NewEventHttpModel instance) =>
    <String, dynamic>{
      'name_event': instance.name_event,
      'time_event': instance.time_event?.toIso8601String(),
      'plece_event': instance.plece_event,
      'about_event': instance.about_event,
      'price': instance.price,
      'age_limit': instance.age_limit,
      'image': instance.image,
      'link': instance.link,
      'name_category': instance.name_category,
    };
