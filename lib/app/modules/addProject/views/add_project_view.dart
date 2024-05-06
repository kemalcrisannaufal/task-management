import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:to_do_list/app/modules/project/controllers/project_controller.dart';
import 'package:to_do_list/app/shared/styles/subheading.dart';
import 'package:to_do_list/app/shared/widget/appbar.dart';

import '../controllers/add_project_controller.dart';

class AddProjectView extends GetView<AddProjectController> {
  const AddProjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToDoAppBar(title: "Tambah Project"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              "Detail Proyek",
              style: SubHeadingStyle(),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: <Widget>[
                TextField(
                  autocorrect: false,
                  controller: controller.name,
                  decoration: InputDecoration(
                    label: Text("Project"),
                    hintText: "Add your project",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                TextField(
                  autocorrect: false,
                  controller: controller.description,
                  decoration: InputDecoration(
                    label: Text("Description"),
                    hintText: "Add your project description",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => Get.find<ProjectController>().addProject(
                  controller.name.text, controller.description.text),
              child: Text("Save Project"),
            ),
          ],
        ),
      ),
    );
  }
}
