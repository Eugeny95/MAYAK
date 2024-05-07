import 'package:json_annotation/json_annotation.dart';

part 'new_event_http_model.g.dart';

@JsonSerializable()
class NewEventHttpModel {
  String? name_event;
  DateTime? time_event;
  String? plece_event;
  String? about_event;
  int? price;
  int? age_limit;
  String? image;
  String? link;
  String? name_category;

  NewEventHttpModel({
    required this.name_event,
    required this.time_event,
    required this.plece_event,
    required this.about_event,
    required this.price,
    required this.age_limit,
    required this.image,
    required this.link,
    required this.name_category,
  });

  factory NewEventHttpModel.fromJson(Map<String, dynamic> json) =>
      _$NewEventHttpModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewEventHttpModelToJson(this);
}
