import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mayak/utils/Validator.dart';

class NewEventPage extends StatefulWidget {
  NewEventPage();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewEventPageState();
  }
}

class NewEventPageState extends State<NewEventPage> {
  final picker = ImagePicker();
  Dio dio = Dio();

  Future<void> uploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      String fileName = pickedFile.path.split('/').last;

      FormData formData = FormData.fromMap({
        "file":
            await MultipartFile.fromFile(pickedFile.path, filename: fileName),
      });

      Response response =
          await dio.post('http://147.45.109.158:9001/upload/', data: formData);

      if (response.statusCode == 200) {
        String eventImageUrl = response.data;
        // Handle the received image URL
        print(eventImageUrl);
      } else {
        // Handle any errors
      }
    }
  }

  TextEditingController dateCtl = TextEditingController();
  String? name_event;

  String? plece_event;
  String? about_event;
  int? price;
  DateTime time_event = DateTime.now();
  List<String> _age = ['0+', '3+', '6+', '12+', '16+', '18+'];
  List<String> _category = [
    'Квизы',
    'Концерты',
    'Шоу',
    'Культура',
    'Спорт',
    'Путешествие'
  ]; // Option 2

  String? age_limit;

  late Future eventImageUrl;
  String? link;
  String? name_category;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(234, 27, 27, 27)),
        title: Text('Предложить новость',
            style: TextStyle(color: Colors.black, fontSize: 20)),
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              width: width * 0.9,
              key: _formKey,
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: height * 0.01)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Выберите категорию:  ',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 244, 244, 244),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton(
                          hint: Text('Категория',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 29, 29,
                                      29))), // Not necessary for Option 1
                          value: name_category,
                          onChanged: (newValue) {
                            setState(() {
                              name_category = newValue;
                            });
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: Color.fromARGB(255, 30, 30, 30),
                          ),
                          iconSize: 28,
                          underline: SizedBox(),
                          items: _category.map((category) {
                            return DropdownMenuItem(
                              child: new Text(
                                category,
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 11, 11, 11),
                                    fontSize: 14),
                              ),
                              value: category,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: height * 0.05)),
                  ElevatedButton(
                    onPressed: uploadImage,
                    child: Text(
                      'Загрузить изображение',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 237, 237, 237)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: height * 0.05)),
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    cursorColor: Color.fromARGB(248, 24, 24, 24),
                    validator: (value) => Validator.isEmptyValid(value!),
                    onChanged: (String value) {
                      name_event = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(248, 24, 24, 24),
                                width: 2.0)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color.fromARGB(231, 29, 29, 29),
                            width: 2.0,
                          ),
                        ),
                        prefixIcon: const Icon(Icons.stars,
                            color: Color.fromARGB(248, 24, 24, 24)),
                        labelText: 'Название события',
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(248, 24, 24, 24))),
                  ),
                  Padding(padding: EdgeInsets.only(top: height * 0.01)),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    minLines: 3,
                    textCapitalization: TextCapitalization.sentences,
                    cursorColor: Color.fromARGB(248, 24, 24, 24),
                    validator: (value) => Validator.isEmptyValid(value!),
                    onChanged: (String value) {
                      about_event = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(248, 24, 24, 24),
                                width: 2.0)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color.fromARGB(231, 29, 29, 29),
                            width: 2.0,
                          ),
                        ),
                        prefixIcon: const Icon(Icons.event_note_sharp,
                            color: Color.fromARGB(248, 24, 24, 24)),
                        labelText: 'Описание события',
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(248, 24, 24, 24))),
                  ),
                  Padding(padding: EdgeInsets.only(top: height * 0.01)),
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    cursorColor: Color.fromARGB(248, 24, 24, 24),
                    validator: (value) => Validator.isEmptyValid(value!),
                    onChanged: (String value) {
                      plece_event = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(248, 24, 24, 24),
                                width: 2.0)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color.fromARGB(231, 29, 29, 29),
                            width: 2.0,
                          ),
                        ),
                        prefixIcon: const Icon(Icons.place_outlined,
                            color: Color.fromARGB(248, 24, 24, 24)),
                        labelText: 'Место проведения события',
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(248, 24, 24, 24))),
                  ),
                  Padding(padding: EdgeInsets.only(top: height * 0.01)),
                  TextField(
                    cursorColor: Color.fromARGB(248, 24, 24, 24),

                    controller: dateCtl,
                    // inputFormatters: <TextInputFormatter>[_dateFormatter],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(248, 24, 24, 24),
                                width: 2.0)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color.fromARGB(231, 29, 29, 29),
                            width: 2.0,
                          ),
                        ),
                        prefixIcon: const Icon(Icons.access_time_outlined,
                            color: Color.fromARGB(248, 24, 24, 24)),
                        labelText: 'Дата и время',
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(248, 24, 24, 24))),
                    onChanged: (String value) {
                      //  completeBefore = value;
                    },
                    onTap: () async {
                      DateTime date = DateTime.now();
                      FocusScope.of(context).requestFocus(new FocusNode());
                      time_event = await showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext builder) {
                                return Container(
                                    height: MediaQuery.of(context)
                                            .copyWith()
                                            .size
                                            .height *
                                        0.4,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          child: Text('Применить',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      219, 255, 255, 255),
                                                  fontSize: 14)),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        Container(
                                          height: height * 0.3,
                                          child: CupertinoDatePicker(
                                            use24hFormat: true,
                                            mode: CupertinoDatePickerMode
                                                .dateAndTime,
                                            initialDateTime:
                                                // DateTime
                                                //     .now(),
                                                DateTime.now()
                                                    .add(Duration(hours: 5)),
                                            minimumDate: DateTime.now()
                                                .add(Duration(hours: 2)),
                                            maximumDate: DateTime(
                                                DateTime.now().year + 1,
                                                DateTime.now().month,
                                                DateTime.now().day),
                                            onDateTimeChanged: (val) {
                                              date = val;
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.03,
                                        )
                                      ],
                                    ));
                              }) ??
                          date;

                      dateCtl.text =
                          DateFormat('dd.MM.yyyy HH:mm').format(time_event);
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: height * 0.01)),
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    cursorColor: Color.fromARGB(248, 24, 24, 24),
                    validator: (value) => Validator.isEmptyValid(value!),
                    onChanged: (String value) {
                      link = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(248, 24, 24, 24),
                                width: 2.0)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color.fromARGB(231, 29, 29, 29),
                            width: 2.0,
                          ),
                        ),
                        prefixIcon: const Icon(Icons.link_rounded,
                            color: Color.fromARGB(248, 24, 24, 24)),
                        labelText: 'Прикрепите ссылку',
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(248, 24, 24, 24))),
                  ),
                  Padding(padding: EdgeInsets.only(top: height * 0.01)),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    cursorColor: Color.fromARGB(248, 24, 24, 24),
                    validator: (value) => Validator.isEmptyValid(value!),
                    onChanged: (String value) {
                      price = value as int?;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(248, 24, 24, 24),
                                width: 2.0)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color.fromARGB(231, 29, 29, 29),
                            width: 2.0,
                          ),
                        ),
                        prefixIcon: const Icon(Icons.monetization_on_outlined,
                            color: Color.fromARGB(248, 24, 24, 24)),
                        labelText: 'Укажите стоимость в рублях ₽',
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(248, 24, 24, 24))),
                  ),
                  Padding(padding: EdgeInsets.only(top: height * 0.01)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Возрастное ограничение:  ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 1),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 244, 244, 244),
                                borderRadius: BorderRadius.circular(10)),
                            child: DropdownButton(
                              hint: Text(
                                '0+',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 36, 36, 36)),
                              ), // Not necessary for Option 1
                              value: age_limit,
                              onChanged: (newValue) {
                                setState(() {
                                  age_limit = newValue;
                                });
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: Color.fromARGB(255, 36, 36, 36),
                              ),
                              iconSize: 28,
                              underline: SizedBox(),
                              items: _age.map((age) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    age,
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 35, 35, 35)),
                                  ),
                                  value: age,
                                );
                              }).toList(),
                            ))
                      ]),
                  Padding(padding: EdgeInsets.only(top: height * 0.03)),
                  Text(
                    '*Нажимая на кнопку «Отправить» вы даете согласие на обработку персональных данных. Предложенное Вами событие будет рассмотрена администратором в течении 24 часов. В случае приемлимого контента, вы увидите свое событие в общей ленте',
                    style: TextStyle(
                        color: Color.fromARGB(248, 24, 24, 24), fontSize: 8),
                  ),
                  Padding(padding: EdgeInsets.only(top: height * 0.01)),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                          elevation: 5,
                          minimumSize: Size(height * 0.75, width * 0.12),
                          backgroundColor: Color.fromARGB(232, 28, 28, 28)),
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) return;
                        try {
                          final result =
                              await InternetAddress.lookup('google.com');
                          if (result.isNotEmpty &&
                              result[0].rawAddress.isNotEmpty) {}
                        } on SocketException catch (_) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Внимание'),
                                  content: Text('Нед доступа к Интернету'),
                                );
                              });
                        }

                        if (!_formKey.currentState!.validate()) return;

                        Response response = await await Dio().post(
                            'http://147.45.109.158:8881/orders_info/reserve_table/',
                            data: {
                              "_category": _category,
                              "eventImageUrl": eventImageUrl,
                              "name_event": name_event,
                              "about_event": about_event,
                              "plece_event": plece_event,
                              "time_event": time_event,
                              "link": link,
                              "price": price,
                              "age_limit": age_limit,
                            });
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Отправить',
                        style: TextStyle(color: Colors.white),
                      )),
                  Padding(padding: EdgeInsets.only(top: height * 0.001)),
                  TextButton(
                    child: const Text('Отмена',
                        style: TextStyle(
                            color: Color.fromARGB(202, 24, 24, 24),
                            fontSize: 14)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
