import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddTaskController extends GetxController {
  late TextEditingController name;
  var dueDate = "".obs;
  @override
  void onInit() {
    super.onInit();
    name = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
