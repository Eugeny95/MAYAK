import 'package:cached_network_image/cached_network_image.dart';

import 'package:icofont_flutter/icofont_flutter.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dialogs/InfoDialog.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  void rebuildAllChildren(BuildContext context) {
    // void rebuild(Element el) {
    //   el.markNeedsBuild();
    //   el.visitChildren(rebuild);
    // }

    // (context as Element).visitChildren(rebuild);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // UserProfile userProfile = Provider.of<UserProfile>(context, listen: true);

    // rebuildAllChildren(context);

    //userProfile.addListener(setState())
    return Stack(
      children: [
        Positioned(
            top: height / 5.8,
            left: width * 0.85,
            child: IconButton(
                icon: Icon(Icons.info_outline_rounded,
                    size: 22, color: Color.fromARGB(148, 58, 58, 58)),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return InfoDialog(
                          // Provider.of<CoffeHouse>(context, listen: true)
                          //     .photos
                          );
                    },
                  );
                })),
        Column(children: [
          Padding(padding: EdgeInsets.only(top: height * 0.06)),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: height * 0.06)),
                Container(
                    width: width - (width * 0.6),
                    height: height / 5.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      color: Color.fromARGB(58, 151, 151, 151),
                      border: Border.all(
                        color: Color.fromARGB(109, 153, 241, 175),
                        width: 1,
                      ),
                      image: DecorationImage(
                          image: AssetImage("assets/YA.png"),
                          fit: BoxFit.cover),
                    )),
                SizedBox(
                  width: width / 15,
                ),
                Container(
                    width: width - (width * 0.6),
                    height: height / 5.5,
                    child: Text(
                      "                  Удобный способ выбрать, как провести свободное время",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(173, 51, 50, 50),
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      color: Color.fromARGB(0, 145, 232, 177),
                      border: Border.all(
                        color: Color.fromARGB(0, 97, 97, 97),
                        width: 1,
                      ),
                    )),
              ]),
          Padding(padding: EdgeInsets.only(top: height * 0.02)),
          Text(
            "Профиль",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromARGB(173, 51, 50, 50),
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: height * 0.01)),
          Container(
              width: width * 0.9,
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color.fromARGB(255, 95, 93, 93),
                        width: 1,
                      )),
                  child: IntrinsicHeight(
                      child: Row(
                    children: [
                      Icon(Icons.person, size: 40),
                      VerticalDivider(
                        color: Color.fromARGB(255, 97, 97, 97),
                        width: 5,
                        thickness: 1,
                      ),
                      // Expanded(
                      //   child: Text('${userProfile.name}'),
                      //   flex: 7,
                      // ),
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Icon(Icons.edit, size: 40),
                            ),
                            onTap: () async {
                              // showDialog(
                              //     context: context,
                              //     builder: (BuildContext context) {
                              //       return EditTextDialog(
                              //           'Введите имя', userProfile.name, (text) {
                              //         userProfile.name = text;
                              //         setState(() {});
                              //       });
                              //     });
                            },
                          ))
                    ],
                  )),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color.fromARGB(255, 99, 99, 99),
                        width: 1,
                      )),
                  child: IntrinsicHeight(
                      child: Row(
                    children: [
                      Icon(Icons.phone_iphone, size: 40),
                      VerticalDivider(
                        color: Color.fromARGB(255, 97, 97, 97),
                        width: 5,
                        thickness: 1,
                      ),
                      // Expanded(
                      //   child: Text('${userProfile.phone}'),
                      //   flex: 7,
                      // ),
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(Icons.edit, size: 40),
                            ),
                            onTap: () async {
                              // showDialog(
                              //     context: context,
                              //     builder: (BuildContext context) {
                              //       return EditTextDialog(
                              //           'Введите телефон', userProfile.phone, (text) {
                              //         userProfile.phone = text;
                              //         setState(() {});
                              //       });
                              //     });
                            },
                          ))
                    ],
                  )),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color.fromARGB(255, 97, 97, 97),
                        width: 1,
                      )),
                  child: IntrinsicHeight(
                      child: Row(
                    children: [
                      Icon(Icons.email, size: 40),
                      VerticalDivider(
                        color: Color.fromARGB(255, 97, 97, 97),
                        width: 5,
                        thickness: 1,
                      ),
                      // Expanded(
                      //   child: Text('${userProfile.email}'),
                      //   flex: 7,
                      // ),
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(Icons.edit, size: 40),
                            ),
                            onTap: () async {
                              // showDialog(
                              //     context: context,
                              //     builder: (BuildContext context) {
                              //       return EditTextDialog(
                              //           'Введите email', userProfile.email, (text) {
                              //         userProfile.email = text;
                              //         setState(() {});
                              //       });
                              //     });
                            },
                          ))
                    ],
                  )),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color.fromARGB(255, 97, 97, 97),
                        width: 1,
                      )),
                  child: IntrinsicHeight(
                      child: Row(
                    children: [
                      Icon(Icons.wallet_giftcard_rounded, size: 40),
                      VerticalDivider(
                        color: Color.fromARGB(255, 97, 97, 97),
                        width: 5,
                        thickness: 1,
                      ),
                      // Expanded(
                      //   child: Text('${userProfile.email}'),
                      //   flex: 7,
                      // ),
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(Icons.edit, size: 40),
                            ),
                            onTap: () async {
                              // showDialog(
                              //     context: context,
                              //     builder: (BuildContext context) {
                              //       return EditTextDialog(
                              //           'Введите email', userProfile.email, (text) {
                              //         userProfile.email = text;
                              //         setState(() {});
                              //       });
                              //     });
                            },
                          ))
                    ],
                  )),
                ),
              ])),
          Padding(padding: EdgeInsets.only(top: height * 0.06)),
          Container(
            width: width / 1.1,
            height: height / 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              color: Color.fromARGB(58, 151, 151, 151),
            ),
            child: Column(children: [
              Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(top: height * 0.04)),
                    Text(
                      "  Расскажи друзьям",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(173, 51, 50, 50),
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(top: height * 0.001)),
                    Container(
                        width: width / 1.4,
                        height: height / 13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // border: Border.all(
                          //   color: Color.fromARGB(255, 99, 99, 99),
                          //   width: 1,
                          // )
                        ),
                        child: Text(
                          "Расскажи о Маяке друзьям и получишь с полки пирожок ",
                          style: TextStyle(
                            color: Color.fromARGB(153, 51, 50, 50),
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    SizedBox(
                      width: width / 30,
                    ),
                    GestureDetector(
                        child: Container(
                            width: width / 7.3,
                            height: height / 22,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(0, 247, 247, 247),
                              image: DecorationImage(
                                  image: AssetImage("assets/Send.png"),
                                  fit: BoxFit.fitHeight),
                            ),
                            child: Text("")),
                        onTap: () async {
                          // final url =
                          //     "https://2gis.ru/voronezh/firm/70000001030259241/tab/reviews?writeReview";
                          // if (await canLaunch(url)) {
                          //   await launch(
                          //     url,
                          //   );
                          // }
                        }),
                  ]),
            ]),
          ),
          Padding(padding: EdgeInsets.only(top: height * 0.02)),
          Container(
            width: width / 1.1,
            height: height / 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              color: Color.fromARGB(58, 151, 151, 151),
            ),
            child: Column(children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(top: height * 0.01)),
                    Text(
                      "Маяк в соцсетях",
                      style: TextStyle(
                        color: Color.fromARGB(157, 51, 50, 50),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(top: height * 0.06)),
                    GestureDetector(
                        child: Container(
                            width: width / 7,
                            height: height / 22,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                              image: DecorationImage(
                                  image: AssetImage("assets/TG.png"),
                                  fit: BoxFit.fitHeight),
                            ),
                            child: Text("")),
                        onTap: () async {
                          // final url =
                          //     "https://yandex.ru/maps/org/thefir_coffee/87155301425/reviews";
                          // if (await canLaunch(url)) {
                          //   await launch(
                          //     url,
                          //   );
                          // }
                        }),
                    SizedBox(
                      width: width / 30,
                    ),
                    GestureDetector(
                        child: Container(
                            width: width / 8,
                            height: height / 22,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(0, 247, 247, 247),
                              image: DecorationImage(
                                  image: AssetImage("assets/VK.png"),
                                  fit: BoxFit.fitHeight),
                            ),
                            child: Text("")),
                        onTap: () async {
                          // final url =
                          //     "https://2gis.ru/voronezh/firm/70000001030259241/tab/reviews?writeReview";
                          // if (await canLaunch(url)) {
                          //   await launch(
                          //     url,
                          //   );
                          // }
                        }),
                  ]),
            ]),
          ),
          Stack(children: <Widget>[]),
        ]),
      ],
    );
  }
}
