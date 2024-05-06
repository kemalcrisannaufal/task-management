import 'package:get/get.dart';
import 'package:to_do_list/app/modules/addTask/controllers/add_task_controller.dart';

class AddTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTaskController>(
      () => AddTaskController(),
    );
  }
}
