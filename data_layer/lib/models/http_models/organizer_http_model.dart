import 'package:data_layer/models/http_models/event_http_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'organizer_http_model.g.dart';

@JsonSerializable()
class OrganizerHttpModel {
  /// The generated code assumes these values exist in JSON.
  String? email;
  String? username;
  String? phone;

  OrganizerHttpModel(
      {required this.email, required this.username, required this.phone});

  factory OrganizerHttpModel.fromJson(Map<String, dynamic> json) =>
      _$OrganizerHttpModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizerHttpModelToJson(this);
}
