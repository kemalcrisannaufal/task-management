import 'package:get/get.dart';
import 'package:to_do_list/app/data/models/note_model.dart';

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
      final data = Note(
        id: DateTime.now().toString(),
        title: title,
        content: content,
        createdAt: DateTime.now().toString(),
      );
      notes.add(data);
      Get.back();
    } else {
      Get.snackbar("Warning", "Please fill all the fields");
    }
  }

  Note findById(String id) {
    return notes.firstWhere((element) => element.id == id);
  }

  void deleteNote(String id) {
    notes.removeWhere((element) => element.id == id);
    Get.snackbar("Success", "Note deleted successfully");
  }
}
