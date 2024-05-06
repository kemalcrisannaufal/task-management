import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:to_do_list/app/data/models/project_model.dart';

class ProjectController extends GetxController {
  var projects = List<Project>.empty().obs;
  late TextEditingController name;
  late TextEditingController dueDate;

  @override
  void onInit() {
    super.onInit();
    name = TextEditingController();
    dueDate = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    name.dispose();
    dueDate.dispose();
    super.onClose();
  }

  Project findById(String id) {
    return projects.firstWhere((element) => element.id == id);
  }

  void addProject(String name, String description) {
    final data = Project(
      id: DateTime.now().toString(),
      name: name,
      description: description,
      tasks: [],
    );
    projects.add(data);
    Get.back();
  }

  void deleteProject(String id) {
    projects.removeWhere((element) => element.id == id);
  }

  void printData(String id) {
    print(findById(id).tasks);
  }

  void addTaskProject(String id, String name, String dueDate) {
    print(id);
    var project = findById(id);
    var task = Tasks(
        id: DateTime.now().toString(),
        name: name,
        dueDate: dueDate,
        status: "Incomplete");
    project.tasks!.add(task);
    projects.refresh();
    Get.back();
  }
}
