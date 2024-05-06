import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/project_controller.dart';

class ProjectView extends GetView<ProjectController> {
  const ProjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProjectView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProjectView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
