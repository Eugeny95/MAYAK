import 'package:cached_network_image/cached_network_image.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import "package:collection/collection.dart";

import '../Dialogs/Addevent.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          // ПРОБЛЕМА ТУТ
          CalendarTimeline(
            initialDate: DateTime(2020, 4, 20),
            firstDate: DateTime(2019, 1, 15),
            lastDate: DateTime(2020, 11, 20),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: Colors.blueGrey,
            dayColor: Colors.teal[200],
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Colors.redAccent[100],
            dotsColor: Color(0xFF333A47),
            selectableDayPredicate: (date) => date.day != 23,
            locale: 'ru',
          ),
          //     // ВОТ ДО ЭТОГО

          //     // SliverGrid(
          //     //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //     //     maxCrossAxisExtent: 200.0,
          //     //     mainAxisSpacing: 10.0,
          //     //     crossAxisSpacing: 10.0,
          //     //     childAspectRatio: 4.0,
          //     //   ),
          //     //   delegate: SliverChildBuilderDelegate(
          //     //     (BuildContext context, int index) {
          //     //       return Container(
          //     //         alignment: Alignment.center,
          //     //         color: Colors.teal[100 * (index % 9)],
          //     //         child: Text('grid item $index'),
          //     //       );
          //     //     },
          //     //     childCount: 20,
          //     //   ),
          //     // ),
          //     // SliverFixedExtentList(
          //     //   itemExtent: 50.0,
          //     //   delegate: SliverChildBuilderDelegate(
          //     //     (BuildContext context, int index) {
          //     //       return Container(
          //     //         alignment: Alignment.center,
          //     //         color: Colors.lightBlue[100 * (index % 9)],
          //     //         child: Text('list item $index'),
          //     //       );
          //     //     },
          //     //   ),
          //     // ),
        ],
      )),
    );
  }
}
