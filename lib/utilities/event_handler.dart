import 'package:smp_kerinci/models/event.dart';
import 'package:flutter/material.dart';

class EventHandler {
  final Map<DateTime, List<Event>> events = {
    DateTime.now().add(Duration(days: 1)): [
      Event(
          title: 'Hello world',
          date: DateTime.now(),
          markingColor: Colors.blue),
    ],
    DateTime.now(): [
      Event(
        title: 'Event 1',
        date: DateTime.now(),
        markingColor: Colors.red,
      ),
      Event(
        title: 'Event 2',
        date: DateTime.now(),
        markingColor: Colors.green,
      ),
      Event(
        title: 'Event 3',
        date: DateTime.now(),
        markingColor: Colors.grey,
      ),
    ],
  };
}
