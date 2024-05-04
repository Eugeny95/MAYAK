import 'package:data_layer/models/http_models/all_events_http_model.dart';
import 'package:data_layer/network/all_events_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:data_layer/data_layer.dart';

void main() {
  test('get internet menu test', () async {
    AllEventsHttpModel allEventsHttpModel =
        await AllEventsRepository().syncAllEvents();
    print(allEventsHttpModel);
  });
}
