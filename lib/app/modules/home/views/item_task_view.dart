import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/app/modules/project/controllers/project_controller.dart';

class ItemTaskView extends GetView<ProjectController> {
  ItemTaskView(this.data);
  final data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Get.toNamed(Routes.ADD_PROJECT, arguments: data.id),
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {
          controller.deleteTaskProject(Get.arguments.toString(), data.id);
          Get.snackbar("Success", "Task deleted successfully");
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                child: (data.status == "Complete")
                    ? Icon(Icons.verified)
                    : Icon(Icons.add_task_rounded),
                radius: 25,
                backgroundColor: (data.status == "Complete")
                    ? Colors.green[300]
                    : Colors.yellow,
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name!,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      data.dueDate!,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              IconButton(
                onPressed: () => controller.makeTaskComplete(
                    Get.arguments.toString(), data.id.toString()),
                icon: Icon(
                  Icons.done_outline_sharp,
                  size: 22,
                  weight: 30,
                  color:
                      (data.status == "Complete") ? Colors.green : Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
