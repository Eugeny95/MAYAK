// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizer_http_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizerHttpModel _$OrganizerHttpModelFromJson(Map<String, dynamic> json) =>
    OrganizerHttpModel(
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$OrganizerHttpModelToJson(OrganizerHttpModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'phone': instance.phone,
    };
