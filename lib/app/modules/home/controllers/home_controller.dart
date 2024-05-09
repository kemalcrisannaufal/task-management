import 'package:get/get.dart';

import '../../../data/models/task_model.dart';

class HomeController extends GetxController {
  var tasks = List<Task>.empty().obs;

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

  Task findById(String id) {
    return tasks.firstWhere((element) => element.id == id);
  }

  void addTask(String name, String dueDate) {
    final data = Task(
        id: DateTime.now().toString(),
        name: name,
        dueDate: dueDate,
        status: "Incomplete");
    tasks.add(data);
    Get.back();
  }
}
