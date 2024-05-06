import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/app/modules/project/controllers/project_controller.dart';
import 'package:to_do_list/app/shared/widget/appbar.dart';

class AddTaskView extends GetView<ProjectController> {
  const AddTaskView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToDoAppBar(
        title: 'Add Task',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextField(
              autocorrect: false,
              controller: controller.name,
              decoration: InputDecoration(
                label: Text("Task"),
                hintText: "Add your task",
                border: OutlineInputBorder(),
              ),
            ),
            IconButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  initialDate: DateTime.now(),
                  lastDate: DateTime(2100),
                ).then((value) => controller.dueDate.text =
                    DateFormat('yyyy-MM-dd').format(value!).toString());
              },
              icon: Row(children: [
                Icon(Icons.calendar_month_outlined),
                Text("Date Picker"),
              ]),
            ),
            ElevatedButton(
              onPressed: () => controller.addTaskProject(
                  Get.arguments.toString(),
                  controller.name.text,
                  controller.dueDate.text),
              child: Text("Simpan"),
            ),
            TextButton(
                onPressed: () => print(controller.projects.toString()),
                child: Text('s'))
          ],
        ),
      ),
    );
  }
}
