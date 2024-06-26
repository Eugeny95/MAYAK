import 'dart:convert';

import 'package:data_layer/models/http_models/all_events_http_model.dart';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AllEventsRepository {
  Future<AllEventsHttpModel> syncAllEvents() async {
    await Hive.initFlutter();
    Response responce =
        await Dio().get('http://90.156.208.220:9000/events/categories');
    var box = await Hive.openBox('menuBox1');

    await box.put('all_events', json.encode(responce.data));
    return AllEventsHttpModel.fromJson(responce.data);
  }

  Future<AllEventsHttpModel> getCachedAllEvents() async {
    await Hive.initFlutter();
    var box = await Hive.openBox('menuBox1');
    Map<String, dynamic> temp = {};
    var data = json.decode(box.get('all_events'));
    return AllEventsHttpModel.fromJson(data);
  }
}
