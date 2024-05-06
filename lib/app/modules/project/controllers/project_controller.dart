import 'package:get/get.dart';
import 'package:to_do_list/app/data/models/project_model.dart';

class ProjectController extends GetxController {
  var projects = List<Project>.empty().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Project findById(String id) {
    return projects.firstWhere((element) => element.id == id);
  }

  void addProject(String name, String description) {
    if (name != "" && description != "") {
      final data = Project(
        id: DateTime.now().toString(),
        name: name,
        description: description,
        tasks: [],
      );
      projects.add(data);
      Get.back();
    } else {
      Get.snackbar(
        "Warning",
        "Please fill all the fields",
      );
    }
  }

  void deleteProject(String id) {
    projects.removeWhere((element) => element.id == id);
  }

  void printData(String id) {
    print(findById(id).tasks);
  }

  void addTaskProject(String id, String name, String dueDate) {
    if (name != "" && dueDate != "") {
      var project = findById(id);
      var task = Tasks(
          id: DateTime.now().toString(),
          name: name,
          dueDate: dueDate,
          status: "Incomplete");
      project.tasks!.add(task);
      projects.refresh();
      Get.back();
    } else {
      Get.snackbar(
        "Warning",
        "Please fill all the fields",
      );
    }
  }

  void deleteTaskProject(String idProject, String idTask) {
    final project = findById(idProject);
    project.tasks!.removeWhere((element) => element.id == idTask);
  }

  void makeTaskComplete(String idProject, String idTask) {
    final data = findById(idProject)
        .tasks!
        .firstWhere((element) => element.id == idTask);
    data.status = "Complete";
    projects.refresh();
  }
}
