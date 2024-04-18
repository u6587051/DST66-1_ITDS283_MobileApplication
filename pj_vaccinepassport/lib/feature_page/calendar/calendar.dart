import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:pj_vaccinepassport/model/Event.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key});

  @override
  State<Calendar> createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
  final auth = FirebaseAuth.instance;

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
    _eventsList = {};
    _fetchEventDataFromFirestore();
  }

  // Fetch event data from Firestore
  void _fetchEventDataFromFirestore() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('appointment')
          .where("email", isEqualTo: auth.currentUser!.email)
          .get();

      // Update _eventsList with Firestore data
      snapshot.docs.forEach((doc) {
        DateTime date = (doc['date'] as Timestamp).toDate();
        Event event = Event(
            doc['title'], doc['hospital'], (doc['date'] as Timestamp).toDate());
        _eventsList.update(date, (value) => value..add(event),
            ifAbsent: () => [event]);
      });

      setState(() {});
    } catch (e) {
      print('Error fetching event data: $e');
    }
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
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('vaccine_history')
                .where("email", isEqualTo: auth.currentUser!.email)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else if (snapshot.hasData) {
                var docs = snapshot.data!.docs;
                return content();
              } else {
                return Center(child: Text("No widget"));
              }
            }));
  }

  Widget content() {
    final _events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventsList);

    List _getEventForDay(DateTime day) {
      return _events[day] ?? [];
    }

    List<Event> _getEventsAfterCurrentDay() {
      List<Event> eventsAfterCurrentDay = [];
      _eventsList.forEach((date, events) {
        if (date.isAfter(DateTime.now())) {
          eventsAfterCurrentDay.addAll(
              events.map((e) => e as Event)); // Cast each event to Event
        }
      });
      return eventsAfterCurrentDay;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Container(
          child: TableCalendar(
            locale: "en_US",
            rowHeight: 43,
            headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color.fromARGB(255, 124, 150, 112),
                )),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, _focusedDay),
            focusedDay: _focusedDay,
            eventLoader: _getEventForDay,
            firstDay: DateTime.utc(2002, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            onDaySelected: _onDaySelected,
            calendarStyle: const CalendarStyle(
              markersAlignment: Alignment.bottomCenter,
              markerDecoration:
                  BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: Center(
            child: Text(
              'การนัดหมายครั้งต่อไป',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color.fromARGB(255, 124, 150, 112),
              ),
            ),
          ),
        ),
        Expanded(
          child: Scrollbar(
            trackVisibility: true,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _getEventForDay(_selectedDay!).isEmpty
                  ? _eventsList.length
                  : _getEventForDay(_selectedDay!).length,
              itemBuilder: (context, index) {
                DateTime eventDate =
                    _selectedDay ?? _focusedDay; // Default to selected day
                Event event;
                if (_selectedDay != null &&
                    _getEventForDay(_selectedDay!).isNotEmpty) {
                  event = _getEventForDay(_selectedDay!)[index];
                  _eventsList.forEach((date, events) {
                    if (events.contains(event)) {
                      eventDate = date;
                    }
                  });
                } else {
                  event = _eventsList.values
                      .expand((events) => events)
                      .toList()[index];
                }

                String formatted_date =
                    DateFormat('dd/MM/yyyy').format(event.date);

                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0, 0.70, 0.80],
                        colors: [
                          Color.fromARGB(255, 133, 161, 130),
                          Color.fromARGB(255, 124, 150, 112),
                          Color.fromARGB(255, 176, 173, 140),
                        ],
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        event.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${formatted_date}\n${event.place}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      isThreeLine: true, // Show place as subtitle
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ]),
    );
  }
}
