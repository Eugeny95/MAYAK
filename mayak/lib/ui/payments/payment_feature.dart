// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sberbank_acquiring/sberbank_acquiring_core.dart';
// import 'package:sberbank_acquiring/sberbank_acquiring_ui.dart';

// class Payment {
//   final SberbankAcquiring acquiring = SberbankAcquiring(
//     SberbankAcquiringConfig.credential(
//       userName: 't3662276447_180224-api',
//       password: 'Q.7rCcUQ',
//       isDebugMode: false,
//     ),
//   );
//   Future<void> webviewPayment1(BuildContext context, int amount) async {}
//   Future<void> webviewPayment(BuildContext context, int amount) async {
//     final RegisterResponse register = await acquiring.register(
//       RegisterRequest(
//         amount: amount,
//         returnUrl: 'https://smitrus.ru',
//         failUrl: 'https://smitrus.ru',
//         orderNumber: '118371439847893749iuoiijlj328472398',
//         pageView: 'MOBILE',
//       ),
//     );
//     /*
//     {"errorCode":"0","errorMessage":"Успешно",
//     "orderNumber":"4",
//     "orderStatus":0,
//     "actionCode":-100,
//     "actionCodeDescription":"",
//     "amount":100,"currency":"643",
//     "date":1709726426044,
//     "orderDescription":"","merchantOrderParams":[],
//     "transactionAttributes":[{"name":"merchantIp","value":"176.59.82.235"}],
//     "attributes":[{"name":"mdOrder","value":"9d9b693d-8b57-7f03-a928-d6dc29950482"}],
//     "terminalId":"123456","paymentAmountInfo":
//     {"paymentState":"CREATED","approvedAmount":0,"depositedAmount":0,"refundedAmount":0,
//     "feeAmount":0,"totalAmount":100},
//     "bankInfo":{"bankCountryCode":"UNKNOWN",
//     "bankCountryName":"<Неизвестно>"},"chargeback":false}
//     */

//     final String? formUrl = register.formUrl;
//     if (!register.hasError && formUrl != null) {
//       Navigator.of(context).push(
//         MaterialPageRoute<void>(
//           builder: (BuildContext context) => Scaffold(
//             body: WebViewPayment(
//               logger: acquiring.logger,
//               formUrl: formUrl,
//               returnUrl: 'https://test.ru/return.html',
//               failUrl: 'https://test.ru/fail.html',
//               onLoad: (bool v) {
//                 debugPrint('WebView load: $v');
//               },
//               onError: () {
//                 debugPrint('WebView Error');
//               },
//               onFinished: (String? v) async {
//                 final GetOrderStatusExtendedResponse status =
//                     await acquiring.getOrderStatusExtended(
//                   GetOrderStatusExtendedRequest(orderId: v),
//                 );

//                 Navigator.of(context).pop();
//               },
//             ),
//           ),
//         ),
//       );
//     }
//   }
// }
