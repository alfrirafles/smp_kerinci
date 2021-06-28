import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:smp_kerinci/utilities/constants.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDate = DateTime.now();
  DateTime focusedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: kCalendarLocale,
      firstDay: DateTime.utc(2021, 1, 1),
      lastDay: DateTime.utc(2100, 12, 31),
      focusedDay: DateTime.now(),
      headerStyle: kCalendarHeaderStyle,
      calendarStyle: CalendarStyle(
        todayDecoration: kCalendarSelectedDayStyle,
        selectedTextStyle: kCalendarSelectedTextStyle,
        selectedDecoration: kCalendarSelectedDayStyle.copyWith(
          border: Border.all(
            style: kCalendarBorderStyle,
            width: kCalendarBorderWidth,
            color: kCalendarBorderColor,
          ),
        ),
        holidayTextStyle: kCalendarHolidayTextStyle,
        weekendTextStyle: kCalendarHolidayTextStyle,
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
          dowTextFormatter: (date, locale) =>
              DateFormat.E(locale).format(date)[0]),
      onDaySelected: (DateTime selectedDay, DateTime focusedDay) =>
          setState(() {
        selectedDate = selectedDay;
        focusedDate = focusedDay;
      }),
      selectedDayPredicate: (DateTime daySelection) =>
          isSameDay(daySelection, selectedDate),
    );
  }
}
