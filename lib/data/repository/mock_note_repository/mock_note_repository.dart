import '../../model/response/mock_note_response.dart';

abstract class MockNoteRepository {

  Future<List<Note>> getNotes({required String userId,});
  Future<Note> createNote({
    required String userId,
    required String title,
    required String content,
    required NoteStatus status,
    required DateTime dateTime,
    required bool isNotificationOn,
  });

   Future<Note> updateNote({
    required String userId,
    required int id,
    required String title,
    required String content,
    required NoteStatus status,
    required DateTime dateTime,
    required bool isNotificationOn,
  });
  Future<void> deleteNote({
    required String userId,
    required int id,
  });
}