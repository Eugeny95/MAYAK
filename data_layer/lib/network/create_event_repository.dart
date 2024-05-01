// import 'dart:convert';

// import 'package:data_layer/models/http_models/menu_http_model.dart';
// import 'package:data_layer/models/http_models/order_http_model.dart';
// import 'package:dio/dio.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// enum CreateEventStatus { success, failure }

// class EventRepository {
//   Future<CreateEventStatus> createEvent(
//       EventHttpModel eventHttpModel, String accessToken) async {
//     try {
//       print(eventHttpModel.toJson());
//       Response responce = await Dio().post(
//           'http://147.45.109.158:8881/orders/order/',
//           data: eventHttpModel.toJson(),
//           options: Options(headers: <String, String>{
//             'authorization': 'Bearer ${accessToken}'
//           }));
//       print(responce.statusCode);

//       if (responce.statusCode == 201) return CreateEventStatus.success;
//     } catch (_) {
//       print(_);
//       return CreateEventStatus.failure;
//     }
//     return CreateEventStatus.failure;
//   }
// }
