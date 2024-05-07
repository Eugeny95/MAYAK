import 'package:data_layer/models/http_models/new_event_http_model.dart';
import 'package:dio/dio.dart';

enum CreateEventStatus { success, failure }

class EventRepository {
  Future<CreateEventStatus> createEvent(
      NewEventHttpModel newEventHttpModel, String accessToken) async {
    try {
      print(newEventHttpModel.toJson());
      Response responce = await Dio().post(
        'http://147.45.109.158:8881/orders/order/',
        data: newEventHttpModel.toJson(),
      );
      print(responce.statusCode);

      if (responce.statusCode == 201) return CreateEventStatus.success;
    } catch (_) {
      print(_);
      return CreateEventStatus.failure;
    }
    return CreateEventStatus.failure;
  }
}
