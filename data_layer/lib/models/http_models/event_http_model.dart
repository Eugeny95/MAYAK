import 'package:data_layer/models/http_models/organizer_http_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_http_model.g.dart';

@JsonSerializable()
class EventHttpModel {
  /// The generated code assumes these values exist in JSON.
  String? name_event;
  DateTime? time_event;
  String? about_event;
  int? age_limit;
  String? link;
  String? plece_event;
  int? price;
  String? image;

  Map<String, dynamic> organizer;

  EventHttpModel(
      {required this.name_event,
      required this.time_event,
      required this.about_event,
      required this.age_limit,
      required this.link,
      required this.plece_event,
      required this.price,
      required this.image,
      required this.organizer});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory EventHttpModel.fromJson(Map<String, dynamic> json) =>
      _$EventHttpModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$EventHttpModelToJson(this);
}
