// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_http_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryHttpModel _$CategoryHttpModelFromJson(Map<String, dynamic> json) =>
    CategoryHttpModel(
      category_name: json['category_name'] as String?,
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => EventHttpModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryHttpModelToJson(CategoryHttpModel instance) =>
    <String, dynamic>{
      'category_name': instance.category_name,
      'events': instance.events,
    };
