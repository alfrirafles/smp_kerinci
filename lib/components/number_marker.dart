import 'package:flutter/material.dart';
import 'package:smp_kerinci/utilities/constants.dart';

class NumberMarker extends StatelessWidget {
  const NumberMarker({
    Key? key,
    required this.markerBackgroundSize,
    required this.textMarkerDisplay,
  }) : super(key: key);

  final double markerBackgroundSize;
  final String textMarkerDisplay;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: CircleAvatar(
          maxRadius: markerBackgroundSize,
          backgroundColor: kCalendarMarkerNumberColor,
          child: Text(
            '$textMarkerDisplay',
            style: kCalendarMarkerNumberStyle,
          ),
        ),
      ),
    );
  }
}
