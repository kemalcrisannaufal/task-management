import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:to_do_list/app/modules/note/controllers/note_controller.dart';
import 'package:to_do_list/app/shared/styles/subheading.dart';
import 'package:to_do_list/app/shared/widget/appbar.dart';

import '../controllers/add_note_controller.dart';

class AddNoteView extends GetView<AddNoteController> {
  const AddNoteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToDoAppBar(title: "Add Note"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              "Detail Note",
              style: SubHeadingStyle(),
            ),
            SizedBox(height: 10),
            TextField(
              autocorrect: false,
              controller: controller.title,
              decoration: InputDecoration(
                label: Text("Title"),
                hintText: "Add your title",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              autocorrect: false,
              maxLines: 5,
              controller: controller.content,
              decoration: InputDecoration(
                label: Text("Content"),
                hintText: "Add your content",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Get.find<NoteController>()
                  .addNote(controller.title.text, controller.content.text),
              child: Text("Save Note"),
            ),
          ],
        ),
      ),
    );
  }
}
