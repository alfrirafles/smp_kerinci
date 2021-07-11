import 'package:flutter/material.dart';
import 'package:smp_kerinci/utilities/constants.dart';

class Marker extends StatelessWidget {
  Marker({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, -4, 0),
      height: kCalendarMarkerHeight,
      width: kCalendarMarkerWidth,
      decoration: BoxDecoration(
        shape: kCalendarMarkerShape,
        color: color,
      ),
    );
  }
}
