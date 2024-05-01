// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_http_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventHttpModel _$EventHttpModelFromJson(Map<String, dynamic> json) =>
    EventHttpModel(
      name_event: json['name_event'] as String?,
      time_event: json['time_event'] as String?,
      place_event: json['place_event'] as String?,
      about_event: json['about_event'] as String?,
      price: json['price'] as String?,
      age_limit: json['age_limit'] as String?,
      image: json['image'] as String?,
      link: json['link'] as String?,
      organizer: (json['organizer'] as List<dynamic>)
          .map((e) => OrganizerHttpModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventHttpModelToJson(EventHttpModel instance) =>
    <String, dynamic>{
      'name_event': instance.name_event,
      'time_event': instance.time_event,
      'place_event': instance.place_event,
      'about_event': instance.about_event,
      'price': instance.price,
      'age_limit': instance.age_limit,
      'image': instance.image,
      'link': instance.link,
      'organizer': instance.organizer,
    };
