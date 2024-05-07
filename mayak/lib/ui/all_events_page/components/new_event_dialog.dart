// import 'dart:js_interop';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// import 'package:dio/dio.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mayak/utils/Validator.dart';

// class NewEventDialog extends StatefulWidget {
//   NewEventDialog();
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return NewEventDialogState();
//   }
// }

// class NewEventDialogState extends State<NewEventDialog> {
//   @override
//   final picker = ImagePicker();
//   Dio dio = Dio();

//   Future<void> uploadImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       String fileName = pickedFile.path.split('/').last;

//       FormData formData = FormData.fromMap({
//         "file":
//             await MultipartFile.fromFile(pickedFile.path, filename: fileName),
//       });

//       Response response =
//           await dio.post('http://147.45.109.158:9001/upload/', data: formData);

//       if (response.statusCode == 200) {
//         String eventImageUrl = response.data;
//         // Handle the received image URL
//         print(eventImageUrl);
//       } else {
//         // Handle any errors
//       }
//     }
//   }

//   String? name_event;
//   DateTime? time_event;
//   String? plece_event;
//   String? about_event;
//   int? price;
//   int? age_limit;
//   late Future eventImageUrl;
//   String? link;
//   String? name_category;

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Предложить новость'),
//       ),
//       body: Column(
//         children: [
//           Center(
//               child: ElevatedButton(
//             onPressed: uploadImage,
//             child: Text('Upload Image'),
//           )),
//           Padding(padding: EdgeInsets.only(top: height * 0.01)),
//           TextFormField(
//             textCapitalization: TextCapitalization.words,
//             cursorColor: Color.fromARGB(248, 24, 24, 24),
//             validator: (value) => Validator.isEmptyValid(value!),
//             onChanged: (String value) {
//               name_event = value;
//             },
//             decoration: InputDecoration(
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(
//                         color: Color.fromARGB(248, 24, 24, 24), width: 2.0)),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide(
//                     color: Color.fromARGB(231, 29, 29, 29),
//                     width: 2.0,
//                   ),
//                 ),
//                 prefixIcon: const Icon(Icons.person_add,
//                     color: Color.fromARGB(248, 24, 24, 24)),
//                 labelText: 'Название события',
//                 labelStyle:
//                     const TextStyle(color: Color.fromARGB(248, 24, 24, 24))),
//           ),
//           Padding(padding: EdgeInsets.only(top: height * 0.01)),
//           TextFormField(
//             cursorColor: const Color.fromARGB(248, 24, 24, 24),
//             keyboardType: TextInputType.number,
//             inputFormatters: <TextInputFormatter>[
//               FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))
//             ],
//             validator: (value) => Validator.isPhoneValid('8' + value!),
//             onChanged: (String value) {
//               // phone = '8' + value;
//             },
//             decoration: InputDecoration(
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(
//                         color: Color.fromARGB(248, 24, 24, 24), width: 2.0)),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide(
//                     color: Color.fromARGB(231, 29, 29, 29),
//                     width: 2.0,
//                   ),
//                 ),
//                 prefixIcon: const Icon(Icons.phone_iphone,
//                     color: Color.fromARGB(248, 24, 24, 24)),
//                 labelText: 'Телефон',
//                 prefixText: '+7',
//                 labelStyle:
//                     const TextStyle(color: Color.fromARGB(248, 24, 24, 24))),
//           ),
//         ],
//       ),
//     );
//   }
// }
