import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key});

  @override
  State<Calendar> createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List> _eventsList = {};

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  void _onDaySelected(DateTime selectedDay, DateTime FocusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _focusedDay = FocusedDay;
        _selectedDay = selectedDay;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDay = _focusedDay;
    _eventsList = {
      DateTime.now().subtract(Duration(days: 2)): ['Event A1', 'Event B1'],
      DateTime.now(): ['Event A2', 'Event B2', 'Event C1', 'Event D1'],
      DateTime.now().add(Duration(days: 1)): [
        'Event A3',
        'Event B3',
        'Event C2',
        'Event D2'
      ],
      DateTime.now().add(Duration(days: 3)):
          Set.from(['Event A4', 'Event A5', 'Event B4']).toList(),
      DateTime.now().add(Duration(days: 7)): [
        'Event A6',
        'Event B5',
        'Event C3'
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0, 1],
                  colors: [
                    Color.fromARGB(255, 45, 71, 55),
                    Color.fromARGB(255, 124, 150, 112),
                  ],
                ),
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent, // Make app bar transparent
              elevation: 0, // Remove app bar shadow
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 90),
                child: Text(
                  "ปฏิทิน",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      body: content(),
    );
  }

  Widget content() {
    final _events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventsList);

    List _getEventForDay(DateTime day) {
      return _events[day] ?? [];
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            child: TableCalendar(
              locale: "en_US",
              rowHeight: 43,
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, _focusedDay),
              focusedDay: _focusedDay,
              eventLoader: _getEventForDay,
              firstDay: DateTime.utc(2002, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              onDaySelected: _onDaySelected,
              calendarStyle: const CalendarStyle(
                markersAlignment: Alignment.bottomCenter,
                markerDecoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                
              ),
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: _getEventForDay(_selectedDay!)
                .map((event) => ListTile(
                      title: Text(event.toString()),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
