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
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 0));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Найди свое событие',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Color.fromARGB(255, 98, 178, 150)),
                ),
              ),
             
              CalendarTimeline(
                showYears: false,
                initialDate: _selectedDate,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
                onDateSelected: (date) => setState(() => _selectedDate = date),
                leftMargin: 20,
                monthColor: Colors.black38,
                dayColor: Colors.black54,
                dayNameColor: Colors.black54,
                activeDayColor: Color.fromARGB(192, 0, 0, 0),
                activeBackgroundDayColor: Color.fromARGB(255, 167, 246, 218),
                dotsColor: Color.fromARGB(0, 17, 17, 17),
                selectableDayPredicate: (date) => date.day != 23,
                locale: 'ru',
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 167, 246, 218)),
                  ),
                  child: const Text(
                    'Мероприятия сегодня',
                    style: TextStyle(color: Color(0xFF333A47)),
                  ),
                  onPressed: () => setState(() => _resetSelectedDate()),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Сегодня: $_selectedDate',
                  style: const TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
