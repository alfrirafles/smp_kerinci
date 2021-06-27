import 'package:flutter/material.dart';
import 'package:smp_kerinci/pages/landing_page.dart';
import 'package:smp_kerinci/pages/calendar_page.dart';
import 'package:smp_kerinci/pages/announcement_page.dart';
import 'utilities/routes.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '$landingPageRoute': (context) => LandingPage(),
        '$calendarPageRoute': (context) => CalendarPage(),
        '$announcementPageRoute': (context) => AnnouncementPage(),
      },
    );
  }
}
