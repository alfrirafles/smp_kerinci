import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:smp_kerinci/utilities/constants.dart';
import 'package:smp_kerinci/models/event.dart';
import 'package:provider/provider.dart';
import 'package:smp_kerinci/utilities/event_handler.dart';
import 'dart:collection';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  DateTime? _selectedDate;
  DateTime _focusedDate = DateTime.now();

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  List<Event> _getEventsForDay(DateTime day) {
    var events = Provider.of<EventHandler>(context, listen: false).events;
    var eventSource = LinkedHashMap<DateTime, List<Event>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(events);
    return eventSource[day] ?? [];
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = _focusedDate;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDate!));
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => EventHandler(),
      child: Column(
        children: [
          TableCalendar(
            calendarBuilders: CalendarBuilders(
                // markerBuilder: (context, day, List<dynamic> events) {
                //   Widget? marker = Container();
                //   if (events.isNotEmpty) {
                //     events.forEach((event) {
                //       List<Event> eventItem = event;
                //       eventItem.forEach((event) {
                //         print(event.runtimeType);
                //         marker = Container(
                //           transform: Matrix4.translationValues(0, -4, 0),
                //           height: 8,
                //           width: 8,
                //           decoration: BoxDecoration(
                //             shape: BoxShape.circle,
                //             color: event.markingColor,
                //           ),
                //         );
                //       });
                //     });
                //     return marker;
                //   }
                // },
                ),
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
                  DateFormat.E(locale).format(date)[0],
            ),
            onDaySelected: (DateTime selectedDay, DateTime focusedDay) =>
                setState(() {
              _selectedDate = selectedDay;
              _focusedDate = focusedDay;
            }),
            selectedDayPredicate: (DateTime daySelection) =>
                isSameDay(daySelection, _selectedDate),
            eventLoader: _getEventsForDay,
          ),
          ValueListenableBuilder<List<Event>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return Flexible(
                child: ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text('${value[index].title}'),
                          subtitle: Text('${value[index].date}'),
                        ),
                      );
                    }),
              );
            },
          ),
        ],
      ),
    );
  }
}
