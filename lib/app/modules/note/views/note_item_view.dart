import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:to_do_list/app/modules/note/controllers/note_controller.dart';

// ignore: must_be_immutable
class NoteItemView extends GetView<NoteController> {
  final id;
  final name;
  Icon icon;
  void Function()? onTap;

  NoteItemView(
      {Key? key,
      required this.id,
      required this.name,
      required this.icon,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            icon,
            SizedBox(width: 10),
            Expanded(
              child: Text(name),
            ),
            IconButton(
              onPressed: () => controller.deleteNote(id),
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
