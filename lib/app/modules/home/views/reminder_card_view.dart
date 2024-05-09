import 'package:flutter/material.dart';

class ReminderCardView extends StatelessWidget {
  final project;
  final task;
  final dueDate;

  const ReminderCardView({
    required this.project,
    required this.task,
    required this.dueDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: const EdgeInsets.all(20),
          height: 130,
          width: 270,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.alarm,
                size: 50,
                color: Color.fromRGBO(135, 138, 245, 1),
              ),
              SizedBox(width: 16),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Text(
                    project,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    task,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    dueDate,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ))
            ],
          )),
    );
  }
}
