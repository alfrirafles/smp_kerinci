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

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDate, selectedDay)) {
      setState(() {
        _selectedDate = selectedDay;
        _focusedDate = focusedDay;
      });
      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
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
              markerBuilder: (context, day, List<Event> events) {
                Widget? marker = Container();
                if (events.isNotEmpty) {
                  return Container(
                    transform: Matrix4.translationValues(0, -4, 0),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  );
                }
              },
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
            onDaySelected: _onDaySelected,
            selectedDayPredicate: (DateTime daySelection) =>
                isSameDay(daySelection, _selectedDate),
            eventLoader: _getEventsForDay,
          ),
          ValueListenableBuilder<List<Event>>(
            valueListenable: _selectedEvents,
            builder: (context, eventList, _) {
              return Flexible(
                child: ListView.builder(
                    itemCount: eventList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Container(
                            margin: EdgeInsets.all(2),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.08,
                            height: MediaQuery.of(context).size.height * 0.04,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: eventList[index].markingColor,
                            ),
                          ),
                          title: Text('${eventList[index].title}'),
                          subtitle: Text('${eventList[index].date}'),
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
