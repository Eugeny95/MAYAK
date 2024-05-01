

// import 'package:cached_network_image/cached_network_image.dart';

// import 'package:easy_image_viewer/easy_image_viewer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mayak/buisiness/auth_bloc/auth_bloc.dart';




// // TODO можно в будущем сделать категории подгружаемыми с интернета

// // ignore: must_be_immutable
// class SelectDishDialog extends StatefulWidget {
//   EventHttpModel dishHttpModel;

//   SelectDishDialog({super.key, required this.dishHttpModel});

//   // SelectDishDialog(this.dish);
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return SelectDishDialogState();
//   }
// }

// class SelectDishDialogState extends State<SelectDishDialog> {
//   // SelectDishDialogState(this.dish) {
//   //   dish.fieldSelection.selectedField = dish.fieldSelection.fields.first;
//   // }
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> propertiesWidget = [];
//     List<Widget> volumesWidget = [];
//     DishHttpModel dishHttpModel = widget.dishHttpModel;
//     for (int i = 0; i < dishHttpModel.modifiers!.length; i++) {
//       continue; // Пропуск всех модификаторов
//       if (dishHttpModel.modifiers![i].name == 'на вынос' ||
//           dishHttpModel.modifiers![i].name == '-одновременно' ||
//           dishHttpModel.modifiers![i].name == 'коробка' ||
//           dishHttpModel.modifiers![i].name == 'лист') continue;
//       propertiesWidget.add(Row(children: [
//         Expanded(
//           flex: 3,
//           child: Text(dishHttpModel.modifiers![i].name!),
//         ),
//         Checkbox(
//           activeColor: const Color.fromARGB(255, 89, 89, 89),
//           value: dishHttpModel.modifiers![i].isSelected,
//           onChanged: (value) {
//             setState(() {
//               dishHttpModel.modifiers![i].isSelected = value!;
//             });
//           },
//         ),
//       ]));
//     }
//     // for (Option volume in dish.fieldSelection.fields) {
//     //   volumesWidget.add(Row(children: [
//     //     Expanded(
//     //       child: Text(volume.name.toString()),
//     //       flex: 3,
//     //     ),
//     //     Text(volume.price.toInt().toString()),
//     //     Radio(
//     //         fillColor: MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 69, 69, 69)),
//     //         focusColor:
//     //             MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 69, 69, 69)),
//     //         value: volume,
//     //         groupValue: dish.fieldSelection.selectedField,
//     //         onChanged: (Option? value) {
//     //           setState(() {
//     //             dish.fieldSelection.selectedField = value!;
//     //           });
//     //         }),
//     //   ]));
//     // }
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     double fontSize = width / 25;
//     //
//     return AlertDialog(
//         contentPadding: EdgeInsets.all(10),
//         insetPadding: const EdgeInsets.all(20),
//         backgroundColor: Color.fromARGB(255, 236, 234, 214),
//         actionsAlignment: MainAxisAlignment.start,
//         content: SizedBox(
//           //  height: height * 0.9,
//           width: width * 0.96,
//           child: ListView(shrinkWrap: true, children: [
//             Column(mainAxisSize: MainAxisSize.max, children: [
//               InkWell(
//                 onTap: () {
//                   final imageProvider =
//                       Image.network(dishHttpModel.imageLinks.first).image;
//                   showImageViewer(context, imageProvider,
//                       swipeDismissible: true, doubleTapZoomable: true);
//                 },
//                 child: Container(
//                   height: height / 3.5,
//                   decoration: BoxDecoration(
//                       color: Colors.black54,
//                       border: Border.all(
//                           width: 1,
//                           color: const Color.fromARGB(211, 45, 45, 45)),
//                       borderRadius: BorderRadius.circular(20.0)),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20.0),
//                     child: CachedNetworkImage(
//                         imageUrl: (dishHttpModel.imageLinks.isEmpty)
//                             ? ''
//                             : dishHttpModel.imageLinks.first,
//                         placeholder: (context, url) =>
//                             const CircularProgressIndicator(),
//                         errorWidget: (context, url, error) =>
//                             const Icon(Icons.error),
//                         fit: BoxFit.cover),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: height * 0.005,
//               ),
//               Text(
//                 dishHttpModel.name ?? '',
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                     fontSize: 20, fontWeight: FontWeight.normal),
//               ),
//               SizedBox(
//                 height: height * 0.005,
//               ),
//               (dishHttpModel.description != '')
//                   ? SizedBox(
//                       width: width * 0.9,
//                       height: height * 0.002,
//                       child: Container(
//                         decoration: const BoxDecoration(
//                             gradient: LinearGradient(colors: [
//                           Color.fromARGB(0, 255, 255, 255),
//                           Color.fromARGB(220, 0, 0, 0),
//                           Color.fromARGB(0, 255, 255, 255),
//                         ])),
//                       ),
//                     )
//                   : Container(),
//               SizedBox(
//                 height: height * 0.01,
//               ),
//               Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//                 (dishHttpModel.description != '')
//                     ? const Text(
//                         'Состав: ',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       )
//                     : Container(),
//                 (dishHttpModel.description != '')
//                     ? SizedBox(
//                         // height: height / 7.5,
//                         child: Text(dishHttpModel.description ?? '',
//                             textAlign: TextAlign.center))
//                     : Container(),
//                 SizedBox(
//                   height: height * 0.01,
//                 ),
//                 SizedBox(
//                   width: width * 0.9,
//                   height: height * 0.002,
//                   child: Container(
//                     decoration: const BoxDecoration(
//                         gradient: LinearGradient(colors: [
//                       Color.fromARGB(0, 255, 255, 255),
//                       Color.fromARGB(220, 0, 0, 0),
//                       Color.fromARGB(0, 255, 255, 255),
//                     ])),
//                   ),
//                 ),
//                 SizedBox(
//                   height: height * 0.01,
//                 ),
//                 // Divider(color: const Color.fromARGB(255, 255, 255, 255)),
//                 (dishHttpModel.proteinsAmount != 0) &
//                         (dishHttpModel.fatAmount != 0) &
//                         (dishHttpModel.carbohydratesAmount != 0) &
//                         (dishHttpModel.energyAmount != 0)
//                     ? const Text(
//                         'Пищевая ценность (100 грамм) ',
//                         textDirection: TextDirection.ltr,
//                         textAlign: TextAlign.right,
//                         style: TextStyle(
//                           fontSize: 10,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       )
//                     : Container(),
//                 (dishHttpModel.proteinsAmount != 0) &
//                         (dishHttpModel.fatAmount != 0) &
//                         (dishHttpModel.carbohydratesAmount != 0) &
//                         (dishHttpModel.energyAmount != 0)
//                     ? SizedBox(
//                         height: height * 0.005,
//                       )
//                     : Container(),
//                 Container(
//                   width: width * 0.6,
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         (dishHttpModel.proteinsAmount != 0)
//                             ? Column(
//                                 children: [
//                                   const Text(
//                                     'Белки ',
//                                     textDirection: TextDirection.ltr,
//                                     textAlign: TextAlign.right,
//                                     style: TextStyle(
//                                       fontSize: 9,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                                   ),
//                                   Text(
//                                     ' ${dishHttpModel.proteinsAmount!.toInt()} г.',
//                                     textDirection: TextDirection.ltr,
//                                     textAlign: TextAlign.right,
//                                     style: const TextStyle(
//                                       fontSize: 9,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                                   )
//                                 ],
//                               )
//                             : Container(),

//                         (dishHttpModel.fatAmount != 0)
//                             ? Column(
//                                 children: [
//                                   const Text(
//                                     'Жиры ',
//                                     textDirection: TextDirection.ltr,
//                                     textAlign: TextAlign.right,
//                                     style: TextStyle(
//                                       fontSize: 9,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                                   ),
//                                   Text(
//                                     ' ${dishHttpModel.fatAmount!.toInt()} г.',
//                                     textDirection: TextDirection.ltr,
//                                     textAlign: TextAlign.right,
//                                     style: const TextStyle(
//                                       fontSize: 9,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                                   )
//                                 ],
//                               )
//                             : Container(),

//                         (dishHttpModel.carbohydratesAmount != 0)
//                             ? Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   const Text(
//                                     'Углеводы ',
//                                     textDirection: TextDirection.ltr,
//                                     textAlign: TextAlign.right,
//                                     style: TextStyle(
//                                       fontSize: 9,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                                   ),
//                                   Text(
//                                     ' ${dishHttpModel.carbohydratesAmount!.toInt()} г.',
//                                     textDirection: TextDirection.ltr,
//                                     textAlign: TextAlign.right,
//                                     style: const TextStyle(
//                                       fontSize: 9,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                                   )
//                                 ],
//                               )
//                             : Container(),

//                         (dishHttpModel.energyAmount != 0)
//                             ? Column(
//                                 children: [
//                                   const Text(
//                                     'Энерг. цен. ',
//                                     textDirection: TextDirection.ltr,
//                                     textAlign: TextAlign.right,
//                                     style: TextStyle(
//                                       fontSize: 9,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                                   ),
//                                   Text(
//                                     ' ${dishHttpModel.energyAmount!.toInt()} ккал.',
//                                     textDirection: TextDirection.ltr,
//                                     textAlign: TextAlign.right,
//                                     style: const TextStyle(
//                                       fontSize: 9,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                                   )
//                                 ],
//                               )
//                             : Container(),

//                         // Энергетическая ценность
//                       ]),
//                 ),
//               ]),
//               propertiesWidget.isNotEmpty
//                   ? Padding(padding: EdgeInsets.only(top: height * 0.02))
//                   : const Column(),
//               Column(children: volumesWidget),
//               propertiesWidget.isNotEmpty
//                   ? SizedBox(
//                       width: width * 0.9,
//                       height: height * 0.002,
//                       child: Container(
//                         decoration: const BoxDecoration(
//                             gradient: LinearGradient(colors: [
//                           Color.fromARGB(0, 255, 255, 255),
//                           Color.fromARGB(220, 0, 0, 0),
//                           Color.fromARGB(0, 255, 255, 255),
//                         ])),
//                       ),
//                     )
//                   : Row(),

//               /*Блок добавок МОДИФИКАТОРЫ

//               propertiesWidget.isNotEmpty
//                   ? const Text(
//                       'Выберите добавки',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     )
//                   : const Column(),
//               Padding(padding: EdgeInsets.only(top: height * 0.02)),
//               // dish.options.isEmpty

//               propertiesWidget.isNotEmpty
//                   ? Row(children: [
//                       Expanded(
//                         flex: 6,
//                         child: Text('Название добавки',
//                             style: TextStyle(
//                                 color: const Color.fromARGB(255, 236, 43, 43),
//                                 fontSize: fontSize)),
//                       ),
//                       Expanded(
//                         flex: 2,
//                         child: Text(
//                           'Цена,₽',
//                           style: TextStyle(
//                               color: const Color.fromARGB(255, 246, 35, 35),
//                               fontSize: fontSize),
//                         ),
//                       ),
//                     ])
//                   : const Row(),
//               Column(children: propertiesWidget),

//               // CounterWidget(
//               //   onChange: ((counter) {
//               //     dish.count = counter;
//               //   }),
//               // ),
//               propertiesWidget.isNotEmpty
//                   ? SizedBox(
//                       width: width * 0.9,
//                       height: height * 0.002,
//                       child: Container(
//                         decoration: const BoxDecoration(
//                             gradient: LinearGradient(colors: [
//                           Color.fromARGB(0, 255, 255, 255),
//                           Color.fromARGB(220, 255, 255, 255),
//                           Color.fromARGB(0, 255, 255, 255),
//                         ])),
//                       ),
//                     )
//                   : const Row(),
//               propertiesWidget.isNotEmpty
//                   ? const Row(children: [
//                       Expanded(
//                         flex: 2,
//                         child: Text(
//                           'Цена,₽',
//                           style: TextStyle(
//                               color: Color.fromARGB(255, 226, 226, 226),
//                               fontSize: 15),
//                         ),
//                       ),
//                     ])
//                   : const Row(),
//               Padding(padding: EdgeInsets.only(top: height * 0.01)),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Цена:',
//                     textDirection: TextDirection.ltr,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                       color: Color.fromARGB(250, 243, 243, 243),
//                     ),
//                   ),
//                   SizedBox(
//                     width: width * 0.03,
//                   ),
//                   Text(
//                     '${dishHttpModel.currentPrice!.toInt()} ₽',
//                     textDirection: TextDirection.ltr,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Color.fromARGB(238, 243, 243, 243),
//                     ),
//                   ),
//                 ],
//               ),

//               */
//               Padding(padding: EdgeInsets.only(top: height * 0.02)),
//               BlocProvider.of<AuthBloc>(context).isAuth()
//                   ? ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),

//                           // side: BorderSide(color: kFourthColor, width: 2)
//                           // <-- Radius
//                         ),
//                         elevation: 8,
//                         minimumSize: Size(height * 0.35, width * 0.12),
//                       ),
//                       onPressed: () {
//                         BlocProvider.of<BasketBloc>(context)
//                             .add(AddDishEvent(dishHttpModel: dishHttpModel));
//                         Navigator.pop(context);
//                       },
//                       child: const Text(
//                         'Добавить в корзину',
//                         style:
//                             TextStyle(color: Color.fromARGB(225, 66, 66, 66)),
//                       ))
//                   : ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           // side: BorderSide(color: kFourthColor, width: 2)
//                           // <-- Radius
//                         ),
//                         elevation: 5,
//                         minimumSize: Size(height * 0.35, width * 0.12),
//                       ),
//                       onPressed: () {
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return HelperDialog();
//                           },
//                         );
//                       },
//                       child: Text(
//                         'Авторизуйтесь, чтобы добавить в корзину',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             color: Color.fromARGB(225, 66, 66, 66),
//                             fontSize: 13),
//                       )),
//               Padding(padding: EdgeInsets.only(top: height * 0.02)),
//             ])
//           ]),
//         ),
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(23))));
//     // TODO: implement build
//   }
// }
