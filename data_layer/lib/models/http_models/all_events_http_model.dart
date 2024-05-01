import 'package:data_layer/models/http_models/category_http_model.dart';
import 'package:data_layer/models/http_models/event_http_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_events_http_model.g.dart';

@JsonSerializable()
class AllEventsHttpModel {
  /// The generated code assumes these values exist in JSON.
  List<CategoryHttpModel>? all_events;

  AllEventsHttpModel({required this.all_events});

  factory AllEventsHttpModel.fromJson(Map<String, dynamic> json) =>
      _$AllEventsHttpModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllEventsHttpModelToJson(this);
}
