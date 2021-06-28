import 'package:flutter/material.dart';
import 'package:smp_kerinci/pages/templates/base_page.dart';
import 'package:smp_kerinci/components/calendar.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      topNavTitle: 'Kalender',
      topNavLeading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
      topNavTrailing: [
        IconButton(
          icon: Icon(Icons.share),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
      body: Container(
        child: Center(
          child: Calendar(),
        ),
      ),
    );
  }
}
