import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:to_do_list/app/modules/home/views/item_task_view.dart';
import 'package:to_do_list/app/modules/home/views/subheading_home_view.dart';
import 'package:to_do_list/app/modules/project/controllers/project_controller.dart';
import 'package:to_do_list/app/routes/app_pages.dart';
import 'package:to_do_list/app/shared/widget/appbar.dart';

class ProjectDetailView extends GetView<ProjectController> {
  const ProjectDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final data = controller.findById(Get.arguments.toString());
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: ToDoAppBar(
        title: data.name!,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              color: Color.fromRGBO(135, 138, 245, 0.7),
              child: Container(
                child: Text(
                  data.description!,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SubheadingHomeView(
              name: "Task",
              routeDestination: Routes.ADD_TASK,
              argument: data.id.toString(),
            ),
            Obx(() => (controller.projects.isEmpty || data.tasks!.isEmpty)
                ? Container(
                    height: 200,
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        "There are no tasks in this project",
                      ),
                    ))
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.tasks!.length,
                    itemBuilder: (context, index) {
                      int reversedIndex = data.tasks!.length - 1 - index;
                      return ItemTaskView(
                        data.tasks![reversedIndex],
                      );
                    },
                  )),
          ],
        ),
      ),
    );
  }
}
