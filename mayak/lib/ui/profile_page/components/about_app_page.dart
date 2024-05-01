import 'package:auth_feature/data/auth_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mayak/buisiness/auth_bloc/auth_bloc.dart';
import 'package:mayak/ui/auth_page/signin_or_signup_screen.dart';
import 'package:mayak/ui/constants.dart';

class AboutAppPage extends StatefulWidget {
  @override
  _AboutAppPageState createState() {
    return _AboutAppPageState();
  }
}

class _AboutAppPageState extends State<AboutAppPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Color.fromARGB(180, 253, 253, 253)),
            backgroundColor: kPrimaryColor,
            title: Text('О приложении',
                style: TextStyle(
                    color: Color.fromARGB(202, 255, 255, 255), fontSize: 18))),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Версия 1.0.3, сборка 3',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),
        ])));
  }
}
