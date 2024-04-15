import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ปฎิทิน')),
      body: content(),
    );
  }

  Widget content() {
    return Column(
      children: [
        Text('123'),
        Container(
          child: TableCalendar(
            focusedDay: today,
            firstDay: DateTime.utc(2002, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
          ),
        )
      ],
    );
  }
}