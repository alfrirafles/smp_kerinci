import 'package:flutter/material.dart';
import 'package:smp_kerinci/pages/landing_page.dart';
import 'package:smp_kerinci/pages/calendar_page.dart';
import 'package:smp_kerinci/pages/announcement_page.dart';
import 'utilities/routes.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  initializeDateFormatting().then((_) => runApp(HomePage()));
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
