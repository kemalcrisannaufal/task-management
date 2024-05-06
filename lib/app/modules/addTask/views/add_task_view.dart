import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/app/modules/addTask/controllers/add_task_controller.dart';
import 'package:to_do_list/app/modules/project/controllers/project_controller.dart';
import 'package:to_do_list/app/shared/styles/subheading.dart';
import 'package:to_do_list/app/shared/widget/appbar.dart';

class AddTaskView extends GetView<AddTaskController> {
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
            Text(
              "Detail Task",
              style: SubHeadingStyle(),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              autocorrect: false,
              controller: controller.name,
              decoration: InputDecoration(
                label: Text("Task"),
                hintText: "Add your task",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            IconButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  initialDate: DateTime.now(),
                  lastDate: DateTime(2100),
                ).then((value) => controller.dueDate.value =
                    DateFormat('yyyy-MM-dd').format(value!).toString());
              },
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.calendar_month_outlined),
                  SizedBox(width: 10),
                  Obx(
                    () => (controller.dueDate == "")
                        ? Text("Due Date")
                        : Text(controller.dueDate.value),
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => Get.find<ProjectController>().addTaskProject(
                  Get.arguments.toString(),
                  controller.name.text,
                  controller.dueDate.value),
              child: Text("Save Task"),
            ),
          ],
        ),
      ),
    );
  }
}
