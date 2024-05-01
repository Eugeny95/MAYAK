import 'package:data_layer/models/http_models/event_http_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_http_model.g.dart';

@JsonSerializable()
class CategoryHttpModel {
  /// The generated code assumes these values exist in JSON.
  String? category_name;
  List<EventHttpModel>? events;

  CategoryHttpModel({required this.category_name, required this.events});

  factory CategoryHttpModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryHttpModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryHttpModelToJson(this);
}
