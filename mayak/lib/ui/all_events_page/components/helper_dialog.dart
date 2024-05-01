import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mayak/ui/constants.dart';

// as datetimepic;

class HelperDialog extends StatefulWidget {
  HelperDialog();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HelperDialogState();
  }
}

class HelperDialogState extends State<HelperDialog> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 236, 234, 214),
      insetPadding: EdgeInsets.all(30),
      title: const Column(
        children: [
          Text(
            'Авторизация/ Регистрация',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(217, 37, 37, 37),
              fontSize: 18,
            ),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      content: SizedBox(
          width: width,
          height: height * 0.05,
          child: Column(children: [
            const Text(
              'Что бы авторизоваться перейдите на страницу "Профиль" >> "Данные пользователя" ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(192, 49, 49, 49), fontSize: 12),
            ),
          ])),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );

    // TODO: implement build
  }
}
