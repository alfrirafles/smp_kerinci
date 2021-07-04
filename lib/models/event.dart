import 'package:flutter/material.dart';

class Event {
  String title;
  Color markingColor;
  DateTime date;

  Event(
      {required this.title,
      required this.date,
      this.markingColor = Colors.red});

  @override
  String toString() => title;

  DateTime get getDate => date;
}
