import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do_list/app/shared/widget/appbar.dart';

import '../controllers/calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  const CalendarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: ToDoAppBar(title: 'Calendar'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          color: Colors.white,
          height: 430,
          padding: EdgeInsets.all(10),
          child: Obx(
            () => TableCalendar(
              focusedDay: controller.focusedDay.value,
              firstDay: DateTime.utc(2020),
              lastDay: DateTime.utc(2030),
              calendarFormat: CalendarFormat.month,
              selectedDayPredicate: (day) {
                return isSameDay(controller.selectedDay.value, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                controller.onDaySelected(selectedDay, focusedDay);
              },
            ),
          ),
        ),
      ),
    );
  }
}
