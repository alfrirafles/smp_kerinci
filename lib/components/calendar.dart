import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:smp_kerinci/components/marker.dart';
import 'package:smp_kerinci/components/number_marker.dart';
import 'package:smp_kerinci/components/event_card.dart';
import 'package:smp_kerinci/components/create_item_modal.dart';
import 'package:smp_kerinci/components/date_picker_button.dart';
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
  DateTime _modalPickedDate = DateTime.now();
  bool checkedState = false;

  int _getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  List<Event> _getEventsForDay(DateTime day) {
    var events = Provider.of<EventHandler>(context, listen: false).events;
    var eventSource = LinkedHashMap<DateTime, List<Event>>(
      equals: isSameDay,
      hashCode: _getHashCode,
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
                if (events.isNotEmpty) {
                  List<Widget> markers = [];
                  events.forEach((event) {
                    markers.add(
                      Marker(color: event.markingColor),
                    );
                  });
                  if (markers.length > kCalendarMarkerDisplayOverflowLimit) {
                    String textMarkerDisplay = '${markers.length}';
                    double markerBackgroundSize = 8;
                    if (markers.length > kCalendarMarkerDigitShowLimit) {
                      textMarkerDisplay = '$kCalendarMarkerDigitShowLimit+';
                      markerBackgroundSize = kCalendarMarkerDigitShowLimit;
                    }
                    return NumberMarker(
                        markerBackgroundSize: markerBackgroundSize,
                        textMarkerDisplay: textMarkerDisplay);
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: markers,
                    );
                  }
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
                      return EventCard(
                        color: eventList[index].markingColor,
                        name: eventList[index].title,
                        schedule: eventList[index].date,
                      );
                    }),
              );
            },
          ),
          CreateItemModal(
            buttonColor: Colors.green,
            buttonDescription: 'Tambahkan Kegiatan',
            modalContent: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Penambahan Kegiatan Baru',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height:
                    MediaQuery.of(context).size.height * kModalItemsGapHeight,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nama Kegiatan',
                  alignLabelWithHint: true,
                ),
              ),
              SizedBox(
                height:
                    MediaQuery.of(context).size.height * kModalItemsGapHeight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Durasi Kegiatan',
                  ),
                  Row(
                    children: [
                      Text('Lebih dari satu hari?'),
                      Checkbox(
                        value: checkedState,
                        onChanged: (bool? value) {},
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DatePickerButton(
                    initialDateDisplay: _selectedDate!,
                    enabled: true,
                  ),
                  Text('-'),
                  DatePickerButton(initialDateDisplay: _selectedDate!),
                ],
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      kModalItemsGapHeight),
              Text('Deskripsi Kegiatan'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Input deskripsi kegiatan..',
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      kModalItemsGapHeight),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: Text('Tambahkan Kegiatan'),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Container(),
            ],
          ),
        ],
      ),
    );
  }
}
