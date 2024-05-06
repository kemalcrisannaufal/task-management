import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:to_do_list/app/modules/project/controllers/project_controller.dart';
import 'package:to_do_list/app/routes/app_pages.dart';

class ProjectItemView extends GetView<ProjectController> {
  final id;
  final name;

  ProjectItemView({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.PROJECT_DETAIL, arguments: id),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Icon(Icons.task_outlined),
            SizedBox(width: 10),
            Expanded(
              child: Text(name),
            ),
            IconButton(
              onPressed: () => controller.deleteProject(id),
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
