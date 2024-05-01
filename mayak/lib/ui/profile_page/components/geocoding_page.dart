// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';

// class GeocodeWidget extends StatefulWidget {
//   @override
//   _GeocodeWidgetState createState() => _GeocodeWidgetState();
// }

// class _GeocodeWidgetState extends State<GeocodeWidget> {
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _latitudeController = TextEditingController();
//   final TextEditingController _longitudeController = TextEditingController();
//   String _output = '';

//   @override
//   void initState() {
//     _addressController.text = 'Воронеж, Лизюкова 25';
//     _latitudeController.text = '52.2165157';
//     _longitudeController.text = '6.9437819';

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           const Padding(
//             padding: EdgeInsets.only(top: 32),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(top: 32),
//           ),
//           TextField(
//             autocorrect: false,
//             controller: _addressController,
//             style: Theme.of(context).textTheme.bodyMedium,
//             decoration: InputDecoration(
//               hintText: 'Адрес',
//             ),
//             keyboardType: TextInputType.text,
//           ),
//           const Padding(
//             padding: EdgeInsets.only(top: 8),
//           ),
//           Center(
//             child: ElevatedButton(
//                 child: Text('Узнать координаты'),
//                 onPressed: () {
//                   locationFromAddress(_addressController.text)
//                       .then((locations) {
//                     var output = 'Нет результата';
//                     if (locations.isNotEmpty) {
//                       output = locations[0].toString();
//                     }

//                     setState(() {
//                       _output = output;
//                     });
//                   });
//                 }),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 child: Text(_output),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
