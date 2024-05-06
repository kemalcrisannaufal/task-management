import 'package:get/get.dart';

class ProjectProvider extends GetConnect {
  String url =
      "https://task-management-kcr-default-rtdb.asia-southeast1.firebasedatabase.app/";

  Future<dynamic> postProject(String name, String description) async {
    final response = await post('$url' + '/projects.json', {
      'name': name,
      'description': description,
      'tasks': [],
    });
    return response.body;
  }

  Future<dynamic> postTaskProject(
      String idProject, String name, String dueDate) async {
    final response = await post('$url' + '/projects/$idProject/tasks.json', {
      'name': name,
      'due_date': dueDate,
      'status': "Incomplete",
    });
    return response.body;
  }

  Future<dynamic> getProjects() async {
    final response = await get('$url' + '/projects.json');
    return response.body;
  }

  Future<void> deleteProject(String id) async =>
      await delete('$url' + '/projects/$id.json');

  Future<void> deleteTaskProject(String idProject, String idTask) async =>
      await delete('$url' + '/projects/$idProject/tasks/$idTask.json');
}
