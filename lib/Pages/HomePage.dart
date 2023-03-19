import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
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
    return new Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          elevation: 50,
          backgroundColor: Color.fromARGB(232, 181, 245, 223),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddEventDialog(
                    // Provider.of<CoffeHouse>(context, listen: true)
                    //     .photos
                    );
              },
            );
          },
          isExtended: true,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          icon: Icon(Icons.add_card, color: Colors.black),
          label: Text(
            'Предложить событие',
            style: TextStyle(color: Colors.black),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        body: CustomScrollView(
          slivers: <Widget>[
            // ПРОБЛЕМА ТУТ

            //  EventCalendar(
            //   calendarType: CalendarType.JALALI,
            //   calendarLanguage: 'fa',
            //   events: [
            //     Event(
            //       child: const Text('Laravel Event'),
            //       dateTime: CalendarDateTime(
            //         year: 1401,
            //         month: 5,
            //         day: 12,
            //         calendarType: CalendarType.JALALI,
            //       ),
            //     ),
            //   ],
            // ),
            // ВОТ ДО ЭТОГО МЕСТА

            // SliverGrid(
            //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //     maxCrossAxisExtent: 200.0,
            //     mainAxisSpacing: 10.0,
            //     crossAxisSpacing: 10.0,
            //     childAspectRatio: 4.0,
            //   ),
            //   delegate: SliverChildBuilderDelegate(
            //     (BuildContext context, int index) {
            //       return Container(
            //         alignment: Alignment.center,
            //         color: Colors.teal[100 * (index % 9)],
            //         child: Text('grid item $index'),
            //       );
            //     },
            //     childCount: 20,
            //   ),
            // ),
            // SliverFixedExtentList(
            //   itemExtent: 50.0,
            //   delegate: SliverChildBuilderDelegate(
            //     (BuildContext context, int index) {
            //       return Container(
            //         alignment: Alignment.center,
            //         color: Colors.lightBlue[100 * (index % 9)],
            //         child: Text('list item $index'),
            //       );
            //     },
            //   ),
            // ),
          ],
        ));
  }
}
