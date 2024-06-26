import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:to_do_list/app/modules/project/controllers/project_controller.dart';

// ignore: must_be_immutable
class ProjectItemView extends GetView<ProjectController> {
  final id;
  final name;
  Icon icon;
  void Function()? onTap;

  ProjectItemView(
      {Key? key,
      required this.id,
      required this.name,
      required this.icon,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            icon,
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
