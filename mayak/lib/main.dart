import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:mayak/buisiness/all_events_page_bloc/select_category_bloc/bloc/select_category_bloc.dart';
import 'package:mayak/buisiness/auth_bloc/auth_bloc.dart';

import 'package:mayak/generated/l10n.dart';

import 'package:mayak/ui/constants.dart';
import 'package:mayak/ui/all_events_page/all_events_screen.dart';

import 'package:mayak/ui/theme.dart';

import 'buisiness/all_events_page_bloc/all_events_bloc/all_events_bloc.dart';
import 'ui/new_event_page/create_event_page.dart';
import 'ui/profile_page/profile_page.dart';

void main() async {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('ru')],
      title: 'mayak',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: lightThemeData(context),
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/main': (context) => MainScreen(),
        //'/call_screen': (context) => CallPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
      },
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) {
            AllEventsBloc allEventsBloc = AllEventsBloc();
            allEventsBloc.add(GetAllEventsEvent());
            return allEventsBloc;
          }),
          BlocProvider(create: (context) {
            return SelectCategoryBloc();
          }),
          BlocProvider(
              lazy: false,
              create: (context) {
                AuthBloc authBloc = AuthBloc();
                authBloc.init();
                authBloc.add(GetUserEvent());
                return authBloc;
              }),
        ],
        child: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    AllEventsPage(),
    ImageFromUrl(),
    ProfilePage(),
  ];
  int _selectedIndex = 0;

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor: Colors.transparent,
      currentIndex: _selectedIndex,
      onTap: (value) {
        print('selected index');
        setState(() {
          _selectedIndex = value;

          if (_selectedIndex == 2) {
            BlocProvider.of<AuthBloc>(context).add(GetUserEvent());
          }
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.line_style), label: "Афиша"),
        BottomNavigationBarItem(icon: Icon(Icons.question_mark), label: "ХЗ"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: screens[_selectedIndex]),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                    color: const Color.fromARGB(60, 0, 0, 0),
                    spreadRadius: 0,
                    blurRadius: 10),
              ],
            ),
            child: Material(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )),
                child: buildBottomNavigationBar())));
  }
}
