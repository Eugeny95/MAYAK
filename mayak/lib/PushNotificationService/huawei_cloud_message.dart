import 'dart:convert';


import 'package:huawei_push/huawei_push.dart';

@pragma('vm:entry-point')
void backgroundMessageCallbackHuawei(RemoteMessage remoteMessage) async {
 // TODO:
  }

  

Future<void> startHuaweiCloudMessageService() async {
  await Push.setAutoInitEnabled(true);
  await Push.registerBackgroundMessageHandler(backgroundMessageCallbackHuawei);
}

Future<String> getHuaweiDeviceToken() async {
  // await Push.setAutoInitEnabled(true);
  String tokenApp = '';
  bool flag = true;
  Push.getTokenStream.listen(
    (String token) {
      tokenApp = token;

      flag = false;
    },
    onError: (error) {},
  );
  Push.getToken('getToken');
  while (flag) {
    await Future.delayed(Duration(microseconds: 100));
  }
  return tokenApp;
}
