import 'package:faculty/Pages/SavedPage.dart';
import 'package:faculty/Pages/HomePage.dart';
import 'package:faculty/Pages/ProfilePage.dart';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:page_transition/page_transition.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';

import 'Utils/ThemeData.dart';

//я это смог
void main() async {
  await Hive.initFlutter();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = MainPage();
  _MyAppState() {
    // Auth().init(
    //     authUrl: 'http://185.119.58.234:5050/security/auth',
    //     refreshTokenUrl: 'http://185.119.58.234:5050/security/refresh',
    //     callback: ({required bool isAuthFlag}) {
    //       if (isAuthFlag)
    //         page = MainPage();
    //       else
    //         page = LoginPage();
    //       setState(() {});
    //     });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(MyTheme.mySystemTheme);
    return
        // MultiProvider(
        // providers: [
        // ChangeNotifierProvider(create: (context) => CoffeHouse()),
        // ChangeNotifierProvider(create: (context) => BasketObject()),
        // ChangeNotifierProvider(create: (context) => OrderController()),
        // ChangeNotifierProvider<UserProfile>(
        //     create: (context) => UserProfile()),
        // ChangeNotifierProvider(create: (context) => OrderObject())
        // ],
        // child:
        MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: MyTheme().basicTheme(),
      home: page,
      // AnimatedSplashScreen(
      //   splash: Image.asset("assets/thefir.png"),
      //   splashIconSize: 200,
      //   nextScreen: page,
      //   duration: 2000,
      //   backgroundColor: Color.fromARGB(255, 255, 255, 255),
      //   splashTransition: SplashTransition.fadeTransition,
      //   pageTransitionType: PageTransitionType.fade,
      // )
      // )
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  MyWidget createState() {
    return MyWidget();
  }
}

class MyWidget extends State {
  void _onItemTapped(ind) {
    setState(() {
      // switch (ind) {
      //   case 0:
      //     Provider.of<CoffeHouse>(context, listen: false).getMainData();
      //     break;
      //   case 1:
      //     Provider.of<OrderController>(context, listen: false)
      //         .getActiveOrders();
      //     break;
      //   case 2:
      //     Provider.of<OrderController>(context, listen: false)
      //         .getHistoryOrders();
      //     break;
      //   case 3:
      //     Provider.of<UserProfile>(context, listen: false).requestUserData();
      //     break;
      // }

      index = ind;
    });
  }

  int index = 0;
  List<Widget> Screens = [HomePage(), BasketPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Center(child: Screens[index]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 38, 38, 38),
        currentIndex: index,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_rounded),
            label: 'События',
          ),
          // BottomNavigationBarItem(
          //   icon:
          //       // new Stack(children: <Widget>[
          //       Icon(Icons.shopping_basket_outlined),
          // (Provider.of<BasketObject>(context, listen: true).count != 0)
          //     ? Positioned(
          //         // draw a red marble
          //         top: -2.0,
          //         right: 0.0,
          //         child: bad.Badge(
          //           badgeContent: Text(
          //             '${Provider.of<BasketObject>(context, listen: true).count}',
          //             style: TextStyle(fontSize: 9),
          //           ),
          //         ))
          //       : Text('')
          // ]),
          //   label: 'Корзина',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
