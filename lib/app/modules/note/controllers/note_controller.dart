import 'package:get/get.dart';
import 'package:to_do_list/app/data/models/note_model.dart';
import 'package:to_do_list/app/data/providers/note_provider.dart';

class NoteController extends GetxController {
  final notes = List<Note>.empty().obs;

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

  void addNote(String title, String content) {
    if (title != "" && content != "") {
      NoteProvider().postNote(title, content).then((value) {
        print(value);
        final data = Note(
          id: value['name'],
          title: title,
          content: content,
          createdAt: DateTime.now().toString(),
        );
        notes.add(data);
        Get.back();
      });
    } else {
      Get.snackbar("Warning", "Please fill all the fields");
    }
  }

  Note findById(String id) {
    return notes.firstWhere((element) => element.id == id);
  }

  void deleteNote(String id) {
    NoteProvider().deleteNote(id).then((value) {
      notes.removeWhere((element) => element.id == id);
      Get.snackbar("Success", "Note deleted successfully");
    });
  }

  void editNote(String id, String title, String content) {
    NoteProvider().editNote(id, title, content).then((value) {
      final data = findById(id);
      data.title = title;
      data.content = content;
      notes.refresh();
      Get.back();
      Get.back();
      Get.snackbar("Success", "Note edited successfully");
    });
  }
}
