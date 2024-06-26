import 'package:get/get.dart';
import 'package:to_do_list/app/modules/project/controllers/project_controller.dart';

class ProjectDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectController>(
      () => ProjectController(),
    );
  }
}
