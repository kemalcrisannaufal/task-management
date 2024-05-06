import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EditNoteController extends GetxController {
  late TextEditingController title;
  late TextEditingController content;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    title = new TextEditingController();
    content = new TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
