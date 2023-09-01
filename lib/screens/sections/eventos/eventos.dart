import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Eventos extends StatefulWidget {
  const Eventos({super.key});

  @override
  State<Eventos> createState() => _EventosState();
}

class _EventosState extends State<Eventos> {
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("...."),//getCon(),
    );
  }

  Widget getCon(){
    return Column(
      children: [
        Container(
          child: TableCalendar(
            locale: "en_US",
            firstDay: DateTime.utc(2022,1,1),
            lastDay: DateTime.utc(2025,1,1),
            focusedDay: currentDate,
          ),
        )
      ],
    );
  }
}
