// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_events_http_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllEventsHttpModel _$AllEventsHttpModelFromJson(Map<String, dynamic> json) =>
    AllEventsHttpModel(
      all_events: (json['all_events'] as List<dynamic>?)
          ?.map((e) => CategoryHttpModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllEventsHttpModelToJson(AllEventsHttpModel instance) =>
    <String, dynamic>{
      'all_events': instance.all_events,
    };
