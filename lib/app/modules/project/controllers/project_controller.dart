import 'package:get/get.dart';
import 'package:to_do_list/app/data/models/project_model.dart';
import '../../../data/providers/project_provider.dart';

class ProjectController extends GetxController {
  var projects = List<Project>.empty().obs;
  // var tasksDueToday = List<Tasks>.empty(growable: true).obs;
  var tasksDueToday = <String, Tasks>{}.obs;

  void initData() {
    ProjectProvider().getProjects().then((response) {
      if (response != null) {
        Map<String, dynamic> data = response;
        data.forEach((keyProject, value) {
          Project project = Project(
            id: keyProject,
            name: value['name'],
            description: value['description'],
            tasks: [],
          );

          Map<String, dynamic> tasks = value['tasks'];
          tasks.forEach((keyTask, value) {
            Tasks task = Tasks(
                id: keyTask,
                name: value['name'],
                dueDate: value['due_date'],
                status: value['status']);
            project.tasks!.add(task);

            if (task.dueDate == DateTime.now().toString().substring(0, 10)) {
              print(project.id!);
              tasksDueToday[project.name! + DateTime.now().toString()] = task;
            }
          });

          projects.add(project);
        });
      }
      print(tasksDueToday.length);
    });
  }

  @override
  void onInit() {
    super.onInit();
    initData();
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
      ProjectProvider().postProject(name, description).then((response) {
        final data = Project(
          id: response['name'],
          name: name,
          description: description,
          tasks: [],
        );
        projects.add(data);
        Get.back();
      });
    } else {
      Get.snackbar(
        "Warning",
        "Please fill all the fields",
      );
    }
  }

  void deleteProject(String id) {
    ProjectProvider()
        .deleteProject(id)
        .then((_) => projects.removeWhere((element) => element.id == id));

    for (var i = 0; i < tasksDueToday.length; i++) {
      if (tasksDueToday.keys.elementAt(i).contains(findById(id).name!)) {
        tasksDueToday.remove(tasksDueToday.keys.elementAt(i));
      }
    }
  }

  void addTaskProject(String id, String name, String dueDate) {
    if (name != "" && dueDate != "") {
      ProjectProvider().postTaskProject(id, name, dueDate).then((response) {
        var project = findById(id);
        var task = Tasks(
            id: response['name'],
            name: name,
            dueDate: dueDate,
            status: "Incomplete");
        project.tasks!.add(task);
        projects.refresh();

        if (task.dueDate == DateTime.now().toString().substring(0, 10)) {
          tasksDueToday[project.name! + DateTime.now().toString()] = task;
        }
        Get.back();
      });
    } else {
      Get.snackbar(
        "Warning",
        "Please fill all the fields",
      );
    }
  }

  void deleteTaskProject(String idProject, String idTask) {
    ProjectProvider().deleteTaskProject(idProject, idTask).then((value) {
      final project = findById(idProject);
      project.tasks!.removeWhere((element) => element.id == idTask);

      bool status = false;
      for (var i = 0; i < tasksDueToday.length && !status; i++) {
        if (tasksDueToday.values.elementAt(i).id == idTask) {
          tasksDueToday.remove(tasksDueToday.keys.elementAt(i));
          status = true;
        }
      }
    });
  }

  void makeTaskComplete(String idProject, String idTask) {
    ProjectProvider().makeTaskComplete(idProject, idTask).then((_) {
      final data = findById(idProject)
          .tasks!
          .firstWhere((element) => element.id == idTask);
      data.status = "Complete";
      projects.refresh();
    });
  }
}
