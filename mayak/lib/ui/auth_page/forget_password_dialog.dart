import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mayak/utils/Validator.dart';

// as datetimepic;

class ForgetPasswordDialog extends StatefulWidget {
  ForgetPasswordDialog();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ForgetPasswordDialogState();
  }
}

class ForgetPasswordDialogState extends State<ForgetPasswordDialog> {
  String email = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 236, 234, 214),
      insetPadding: EdgeInsets.all(30),
      title: Column(
        children: [
          Text(
            'Забыли пароль?',
            style: TextStyle(color: Color.fromARGB(210, 23, 23, 23)),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      content: Container(
          width: width,
          height: height * 0.3,
          child: Column(children: [
            Text(
              'Укажите e-mail, указанный при регистрации и мы вышлем ссылку восстановления пароля ',
              style: TextStyle(
                  color: Color.fromARGB(178, 37, 37, 37), fontSize: 12),
            ),
            Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(top: height * 0.02)),
                    TextFormField(
                      cursorColor: Color.fromARGB(209, 37, 37, 37),
                      //controller: TextEditingController()..text = dateTime,

                      //initialValue: dateTime,
                      validator: (value) => Validator.isEmailValid(value),
                      onChanged: (String value) {
                        email = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(209, 46, 46, 46),
                                  width: 2.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(209, 46, 46, 46),
                                  width: 1.0)),
                          prefixIcon: Icon(Icons.mail,
                              color: Color.fromARGB(209, 46, 46, 46)),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(209, 46, 46, 46))),
                    ),
                    Padding(padding: EdgeInsets.only(top: height * 0.02)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(209, 46, 46, 46),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                          elevation: 5,
                          minimumSize: Size(height * 0.75, width * 0.12),
                        ),
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
                          print(email);

                          try {
                            Response response = await Dio().post(
                                'http://147.45.109.158:8881/auth/refresh_password/',
                                data: {"email": email});
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Ссылка для сброса пароля отпарвлена на  Вашу почту!')));
                          } on DioError catch (e) {
                            // print('pisun');
                            // if (e.response?.statusCode == 409) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Пользователя с таким e-mail не существует')));
                          }
                          // } on DioError catch (_, e) {
                          // if (_.response!.statusCode == 409) {
                          // print('409');
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //     content: Text(
                          //         'Пользователя с таким e-mail не существует')));
                          // }
                          // }
                          // Navigator.pop(context);
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //     content: Text(
                          //         'Ссылка для сброса пароля отпарвлена на  Вашу почту!')));
                        },
                        child: Text(
                          'Восстановить пароль',
                          style: TextStyle(),
                        )),
                    TextButton(
                      child: Text('Отмена',
                          style: TextStyle(
                              color: Color.fromARGB(209, 46, 46, 46),
                              fontSize: 14)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ))
          ])),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );

    // TODO: implement build
  }
}
