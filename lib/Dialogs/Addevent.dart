import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import '../Widgets/DropListAges.dart';
import '../Widgets/DropListWrapper.dart';
import 'Addevent.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:collection/collection.dart";

List<String> caterories = [
  'Вечеринки',
  "Театр",
  "Кафе",
  "Игры",
  "Путешествия",
  "Спорт",
  "Мастер-класс",
  "Образование",
  'Здоровье'
];
List<String> ages = [
  'Все',
  "0+",
  "6+",
  "12+",
  "18+",
];

class AddEventDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddEventDialogState();
  }
}

class _AddEventDialogState extends State<AddEventDialog> {
  @override
  Widget build(BuildContext context) {
    String _selectedDateTime;
    // ДОБАВЛЕНИЕ ФОТО
    // List<Widget> imagesWidget = [];
    // for (int i = 0; i < images.length; i++) {
    //   imagesWidget.add(
    //     AddPicture(
    //         onFileUploaded: (String url) {},
    //         onFileLoaded: (String path) {},
    //         onFileDeleted: (String uri) {
    //           print('FileRemoved $uri');

    //           setState(() {
    //             images.remove(uri);
    //             if (newImages.contains(uri)) {
    //               newImages.remove(uri);
    //             }
    //           });
    //         },
    //         url: images[i],
    //         key: UniqueKey()),
    //   );
    // }
    // imagesWidget.add(AddPicture(
    //     onFileUploaded: (String url) {
    //       print('File uploaded $url');

    //       setState(() {
    //         images.add(url);
    //         newImages.add(url);
    //       });
    //     },
    //     onFileLoaded: (String path) {},
    //     onFileDeleted: null,
    //     url: '',
    //     key: UniqueKey()));

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AlertDialog(
        insetPadding: EdgeInsets.all(10),
        title: Text("Предложить событие",
            style: TextStyle(
                color: Color.fromARGB(255, 41, 41, 41),
                fontWeight: FontWeight.bold,
                fontSize: 22)),
        actionsAlignment: MainAxisAlignment.center,
        content: Container(
            height: height * 0.9,
            width: width * 0.96,
            child: ListView(children: [
              Form(
                  //  key: _formKey,
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text('Выберите категорию из списка:',
                          style: TextStyle(color: Colors.black, fontSize: 14))),
                  Align(
                      alignment: Alignment.topLeft,
                      child: DropListWrapper(
                          items: caterories, onSelect: (String newValue) {})),
                  Padding(padding: EdgeInsets.only(top: height * 0.01)),
                  TextFormField(
                    cursorColor: Color.fromARGB(255, 97, 97, 97),
                    validator: (value) {},
                    maxLines: 2,
                    onChanged: (String value) {},
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 97, 97, 97),
                                width: 2.0)),
                        prefixIcon: Icon(Icons.calendar_today_rounded,
                            color: Color.fromARGB(255, 97, 97, 97)),
                        labelText: 'Название (не более 30 символов)',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 97, 97, 97),
                            fontSize: 14)),
                  ),
                  Padding(padding: EdgeInsets.only(top: height * 0.01)),
                  Container(
                      height: height * 0.2,
                      width: width * 0.7,
                      child: Text(
                          'Блок добавления фото (реализован для Факультета!!!)',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 14))),
                  Padding(padding: EdgeInsets.only(top: height * 0.01)),
                  TextFormField(
                    cursorColor: Color.fromARGB(255, 97, 97, 97),
                    //controller: TextEditingController()..text = dateTime,

                    //initialValue: dateTime,

                    onChanged: (String value) {},
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 97, 97, 97),
                                width: 2.0)),
                        prefixIcon: Icon(Icons.place,
                            color: Color.fromARGB(255, 97, 97, 97)),
                        labelText: 'Место проведения',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 97, 97, 97),
                            fontSize: 14)),
                  ),
                  Padding(padding: EdgeInsets.only(top: height * 0.01)),
                  Align(
                      alignment: Alignment.topLeft,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                            elevation: 5,
                            minimumSize: Size(height * 0.20, width * 0.1),
                          ),
                          onPressed: () async {
                            DatePicker.showDateTimePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(1980, 1, 1),
                                maxTime: DateTime(3000, 12, 31),
                                onConfirm: (dateTime) {
                              setState(() {
                                _selectedDateTime =
                                    DateFormat("yyyy-MM-dd  HH-mm-ss")
                                        .format(dateTime);
                              });
                            }, locale: LocaleType.ru);
                          },
                          child: Text('Выбрать дату и время',
                              style: TextStyle(color: Colors.black)))),
                  Padding(padding: EdgeInsets.only(top: height * 0.01)),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text('Выберите возрастную категорию:',
                          style: TextStyle(color: Colors.black, fontSize: 14))),
                  Align(
                      alignment: Alignment.topLeft,
                      child: DropListAges(
                          items: ages, onSelect: (String newValue1) {})),
                  Padding(padding: EdgeInsets.only(top: height * 0.01)),
                  TextField(
                    cursorColor: Color.fromARGB(255, 77, 77, 77),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: (String value) {},
                    decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 77, 77, 77),
                        focusColor: Color.fromARGB(255, 77, 77, 77),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 77, 77, 77),
                                width: 2.0)),
                        prefixIcon: Icon(Icons.description,
                            color: Color.fromARGB(255, 94, 94, 94)),
                        labelText: 'Описание (не более 70 символов)',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 77, 77, 77),
                            fontSize: 14)),
                  ),
                  Padding(padding: EdgeInsets.only(top: height * 0.01)),
                  TextFormField(
                    cursorColor: Color.fromARGB(255, 97, 97, 97),
                    //controller: TextEditingController()..text = dateTime,

                    //initialValue: dateTime,

                    onChanged: (String value) {},
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 97, 97, 97),
                                width: 2.0)),
                        prefixIcon: Icon(Icons.tag,
                            color: Color.fromARGB(255, 97, 97, 97)),
                        labelText: 'Добавьте теги',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 97, 97, 97),
                            fontSize: 14)),
                  ),
                  Padding(padding: EdgeInsets.only(top: height * 0.02)),
                ],
              )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    elevation: 5,
                    minimumSize: Size(height * 0.65, width * 0.12),
                  ),
                  onPressed: () {
                    // coffeHouse.photos = images;
                    // isCansel = false;
                    // print(coffeHouse.photos);
                    // coffeHouse.updateMainInformation();

                    // Navigator.pop(context);
                  },
                  child: Text('Предложить событие',
                      style: TextStyle(color: Colors.black))),
              Padding(padding: EdgeInsets.all(5)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    elevation: 5,
                    minimumSize: Size(height * 0.45, width * 0.12),
                  ),
                  onPressed: () {
                    // isCansel = true;
                    // Navigator.pop(context);
                  },
                  child:
                      Text('Отменить', style: TextStyle(color: Colors.black)))
            ])),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))));
    // TODO: implement build
  }
}
