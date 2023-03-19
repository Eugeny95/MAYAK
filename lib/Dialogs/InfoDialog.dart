import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import "package:collection/collection.dart";

class InfoDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InfoDialogState();
  }
}

class _InfoDialogState extends State<InfoDialog> {
  @override
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AlertDialog(
        insetPadding: EdgeInsets.all(20),
        title: Text("О приложении Маяк",
            style: TextStyle(
              color: Color.fromARGB(255, 96, 96, 96),
              fontWeight: FontWeight.bold,
            )),
        actionsAlignment: MainAxisAlignment.center,
        content: Container(
            height: height * 0.15,
            width: width * 0.6,
            child: ListView(children: [
              Text("Версия 1.1.1 Сборка 3",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 96, 96, 96),
                    fontWeight: FontWeight.normal,
                  )),
              Padding(padding: EdgeInsets.all(1)),
              Text("",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 96, 96, 96),
                    fontWeight: FontWeight.normal,
                  )),
            ])),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))));
    // TODO: implement build
  }
}
