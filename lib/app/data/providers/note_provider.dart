import 'package:get/get.dart';

import '../models/note_model.dart';

class NoteProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Note.fromJson(map);
      if (map is List) return map.map((item) => Note.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Note?> getNote(int id) async {
    final response = await get('note/$id');
    return response.body;
  }

  Future<Response<Note>> postNote(Note note) async => await post('note', note);
  Future<Response> deleteNote(int id) async => await delete('note/$id');
}
