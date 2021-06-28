import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

const kTopNavBackgroundColor = Colors.green;
const kImageAssetsSourceDirectory = 'assets/images/';

const Set<MaterialState> kButtonInteractiveStates = <MaterialState>{
  MaterialState.pressed,
  MaterialState.hovered,
  MaterialState.focused,
};
const double kButtonVerticalPadding = 15;
const double kButtonHorizontalPadding = 25;
const kButtonBorderStyle = BorderStyle.solid;
const kButtonBorderColor = Colors.green;

const kLandingImageWidthFactor = 0.6;
const kLandingImageHeightFactor = 0.25;

const kCalendarLocale = 'id_ID';
const kCalendarHeaderStyle = HeaderStyle(
  titleCentered: true,
  formatButtonVisible: false,
);
const kCalendarSelectedDayStyle = BoxDecoration(
  color: Colors.green,
  shape: BoxShape.circle,
);
const kCalendarSelectedTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 12,
  fontWeight: FontWeight.bold,
);
const kCalendarHolidayTextStyle = TextStyle(
  color: Colors.red,
);
const kCalendarBorderColor = Color(0xFF225523);
const kCalendarBorderWidth = 4.0;
const kCalendarBorderStyle = BorderStyle.solid;

const kAnnouncementCardPadding = EdgeInsets.symmetric(
  vertical: 12,
  horizontal: 20,
);
const kAnnouncementTitleTextStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

enum Orientation {
  leftToRight,
  rightToLeft,
}
