import 'package:get/get.dart';

import '../models/project_model.dart';

class ProjectProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Project.fromJson(map);
      if (map is List)
        return map.map((item) => Project.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Project?> getProject(int id) async {
    final response = await get('project/$id');
    return response.body;
  }

  Future<Response<Project>> postProject(Project project) async =>
      await post('project', project);
  Future<Response> deleteProject(int id) async => await delete('project/$id');
}
