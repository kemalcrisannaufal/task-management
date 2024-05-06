import 'package:get/get.dart';

class NoteProvider extends GetConnect {
  String url =
      "https://task-management-kcr-default-rtdb.asia-southeast1.firebasedatabase.app/";

  Future<dynamic> postNote(String title, String content) async {
    final response = await post('$url' + '/notes.json', {
      'title': title,
      'content': content,
      'createdAt': DateTime.now().toString(),
    });
    return response.body;
  }

  Future<void> editNote(String id, String title, String content) async {
    await patch('$url' + '/notes/$id.json', {
      'title': title,
      'content': content,
    });
  }

  Future<void> deleteNote(String id) async {
    await delete('$url' + '/notes/$id.json');
  }
}
