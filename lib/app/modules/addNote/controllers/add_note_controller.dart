import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddNoteController extends GetxController {
  late TextEditingController title;
  late TextEditingController content;

  @override
  void onInit() {
    super.onInit();
    title = TextEditingController();
    content = TextEditingController();
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
