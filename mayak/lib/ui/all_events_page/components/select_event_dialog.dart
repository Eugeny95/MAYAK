import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_layer/models/http_models/event_http_model.dart';

import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mayak/buisiness/auth_bloc/auth_bloc.dart';

// TODO можно в будущем сделать категории подгружаемыми с интернета

// ignore: must_be_immutable
class SelectEventDialog extends StatefulWidget {
  EventHttpModel eventHttpModel;

  SelectEventDialog({super.key, required this.eventHttpModel});

  // SelectDishDialog(this.dish);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SelectEventDialogState();
  }
}

class SelectEventDialogState extends State<SelectEventDialog> {
  @override
  Widget build(BuildContext context) {
    List<Widget> propertiesWidget = [];
    List<Widget> volumesWidget = [];
    EventHttpModel eventHttpModel = widget.eventHttpModel;

    // for (Option volume in dish.fieldSelection.fields) {
    //   volumesWidget.add(Row(children: [
    //     Expanded(
    //       child: Text(volume.name.toString()),
    //       flex: 3,
    //     ),
    //     Text(volume.price.toInt().toString()),
    //     Radio(
    //         fillColor: MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 69, 69, 69)),
    //         focusColor:
    //             MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 69, 69, 69)),
    //         value: volume,
    //         groupValue: dish.fieldSelection.selectedField,
    //         onChanged: (Option? value) {
    //           setState(() {
    //             dish.fieldSelection.selectedField = value!;
    //           });
    //         }),
    //   ]));
    // }
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double fontSize = width / 25;
    //
    return AlertDialog(
        contentPadding: EdgeInsets.all(10),
        insetPadding: const EdgeInsets.all(20),
        backgroundColor: Color.fromARGB(255, 236, 234, 214),
        actionsAlignment: MainAxisAlignment.start,
        content: SizedBox(
          //  height: height * 0.9,
          width: width * 0.96,
          child: ListView(shrinkWrap: true, children: [
            Column(mainAxisSize: MainAxisSize.max, children: [
              InkWell(
                onTap: () {
                  final imageProvider =
                      Image.network(eventHttpModel.image!).image;
                  showImageViewer(context, imageProvider,
                      swipeDismissible: true, doubleTapZoomable: true);
                },
                child: Container(
                  height: height / 3.5,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(211, 45, 45, 45)),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: CachedNetworkImage(
                        imageUrl: (eventHttpModel.image!.isEmpty)
                            ? ''
                            : eventHttpModel.image!,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.005,
              ),
              Text(
                eventHttpModel.name_event ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: height * 0.005,
              ),
              (eventHttpModel.about_event != '')
                  ? SizedBox(
                      width: width * 0.9,
                      height: height * 0.002,
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Color.fromARGB(0, 255, 255, 255),
                          Color.fromARGB(220, 0, 0, 0),
                          Color.fromARGB(0, 255, 255, 255),
                        ])),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: height * 0.01,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (eventHttpModel.about_event != '')
                        ? const Text(
                            'Описание: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        : Container(),
                    (eventHttpModel.about_event != '')
                        ? SizedBox(
                            // height: height / 7.5,
                            child: Text(eventHttpModel.about_event ?? '',
                                textAlign: TextAlign.center))
                        : Container(),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    SizedBox(
                      width: width * 0.9,
                      height: height * 0.002,
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Color.fromARGB(220, 0, 0, 0),
                          Color.fromARGB(0, 255, 255, 255),
                          Color.fromARGB(0, 255, 255, 255),
                        ])),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    // Divider(color: const Color.fromARGB(255, 255, 255, 255)),
                  ]),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (eventHttpModel.link != '')
                        ? const Text(
                            'Сылка на мероприятие: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        : Container(),
                    (eventHttpModel.link != '')
                        ? SizedBox(
                            // height: height / 7.5,
                            child: Text(eventHttpModel.link ?? '',
                                textAlign: TextAlign.center))
                        : Container(),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    SizedBox(
                      width: width * 0.9,
                      height: height * 0.002,
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Color.fromARGB(220, 0, 0, 0),
                          Color.fromARGB(0, 255, 255, 255),
                          Color.fromARGB(0, 255, 255, 255),
                        ])),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    // Divider(color: const Color.fromARGB(255, 255, 255, 255)),
                  ]),
              propertiesWidget.isNotEmpty
                  ? Padding(padding: EdgeInsets.only(top: height * 0.02))
                  : const Column(),
              Column(children: volumesWidget),
              propertiesWidget.isNotEmpty
                  ? SizedBox(
                      width: width * 0.9,
                      height: height * 0.002,
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Color.fromARGB(0, 255, 255, 255),
                          Color.fromARGB(220, 0, 0, 0),
                          Color.fromARGB(0, 255, 255, 255),
                        ])),
                      ),
                    )
                  : Row(),

              /*Блок добавок МОДИФИКАТОРЫ

              propertiesWidget.isNotEmpty
                  ? const Text(
                      'Выберите добавки',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  : const Column(),
              Padding(padding: EdgeInsets.only(top: height * 0.02)),
              // dish.options.isEmpty

              propertiesWidget.isNotEmpty
                  ? Row(children: [
                      Expanded(
                        flex: 6,
                        child: Text('Название добавки',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 236, 43, 43),
                                fontSize: fontSize)),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Цена,₽',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 246, 35, 35),
                              fontSize: fontSize),
                        ),
                      ),
                    ])
                  : const Row(),
              Column(children: propertiesWidget),

              // CounterWidget(
              //   onChange: ((counter) {
              //     dish.count = counter;
              //   }),
              // ),
              propertiesWidget.isNotEmpty
                  ? SizedBox(
                      width: width * 0.9,
                      height: height * 0.002,
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Color.fromARGB(0, 255, 255, 255),
                          Color.fromARGB(220, 255, 255, 255),
                          Color.fromARGB(0, 255, 255, 255),
                        ])),
                      ),
                    )
                  : const Row(),
              propertiesWidget.isNotEmpty
                  ? const Row(children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Цена,₽',
                          style: TextStyle(
                              color: Color.fromARGB(255, 226, 226, 226),
                              fontSize: 15),
                        ),
                      ),
                    ])
                  : const Row(),
              Padding(padding: EdgeInsets.only(top: height * 0.01)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Цена:',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color.fromARGB(250, 243, 243, 243),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Text(
                    '${dishHttpModel.currentPrice!.toInt()} ₽',
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(238, 243, 243, 243),
                    ),
                  ),
                ],
              ),

              */
              Padding(padding: EdgeInsets.only(top: height * 0.02)),
              BlocProvider.of<AuthBloc>(context).isAuth()
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),

                          // side: BorderSide(color: kFourthColor, width: 2)
                          // <-- Radius
                        ),
                        elevation: 8,
                        minimumSize: Size(height * 0.35, width * 0.12),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Добавить в корзину',
                        style:
                            TextStyle(color: Color.fromARGB(225, 66, 66, 66)),
                      ))
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          // side: BorderSide(color: kFourthColor, width: 2)
                          // <-- Radius
                        ),
                        elevation: 5,
                        minimumSize: Size(height * 0.35, width * 0.12),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Авторизуйтесь, чтобы добавить в корзину',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(225, 66, 66, 66),
                            fontSize: 13),
                      )),
              Padding(padding: EdgeInsets.only(top: height * 0.02)),
            ])
          ]),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(23))));
    // TODO: implement build
  }
}
