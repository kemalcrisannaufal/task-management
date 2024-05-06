import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProjectController extends GetxController {
  late TextEditingController name;
  late TextEditingController description;

  @override
  void onInit() {
    super.onInit();
    name = TextEditingController();
    description = TextEditingController();
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
