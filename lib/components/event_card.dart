import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  EventCard({
    required this.color,
    required this.name,
    required this.schedule,
  });
  final Color color;
  final String name;
  final DateTime schedule;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          margin: EdgeInsets.all(2),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.08,
          height: MediaQuery.of(context).size.height * 0.04,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            // color: eventList[index].markingColor,
          ),
        ),
        // title: Text('${eventList[index].title}'),
        title: Text('$name'),
        // subtitle: Text('${eventList[index].date}'),
        subtitle: Text('$schedule'),
      ),
    );
  }
}
