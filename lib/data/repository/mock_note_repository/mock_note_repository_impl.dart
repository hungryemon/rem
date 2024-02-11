import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rem/app/base/base_remote_source.dart';
import 'package:rem/data/model/response/mock_note_response.dart';

import 'mock_note_repository.dart';

class MockNoteRepositoryImpl extends BaseRemoteSource
    implements MockNoteRepository {
 final FlutterSecureStorage _storage = FlutterSecureStorage();

  String _hashUserId(String userId) {
    return sha256.convert(utf8.encode(userId)).toString();
  }

  Future<List<Note>> getNotes({required String userId}) async {
    final hashedUserId = _hashUserId(userId);
    final String? notesJson = await _storage.read(key: hashedUserId);
    if (notesJson != null) {
      final List<dynamic> decodedNotes = jsonDecode(notesJson);
      return decodedNotes.map((noteJson) => Note.fromJson(noteJson)).toList();
    }
    return [];
  }

  Future<Note> createNote({
    required String userId,
    required String title,
    required String content,
    required NoteStatus status,
    required DateTime dateTime,
    required bool isNotificationOn,
  }) async {
    final List<Note> existingNotes = await getNotes(userId: userId);
    final newNote = Note(
      id: existingNotes.isEmpty ? 1 : existingNotes.last.id + 1,
      title: title,
      content: content,
      status: status,
      dateTime: dateTime,
      isNotificationOn: isNotificationOn,
    );
    final updatedNotes = [...existingNotes, newNote];
    await _storage.write(key: _hashUserId(userId), value: jsonEncode(updatedNotes.map((note) => note.toJson()).toList()));
    return newNote;
  }

  Future<Note> updateNote({
    required String userId,
    required int id,
    required String title,
    required String content,
    required NoteStatus status,
    required DateTime dateTime,
    required bool isNotificationOn,
  }) async {
    List<Note> existingNotes = await getNotes(userId: userId);
    final index = existingNotes.indexWhere((note) => note.id == id);
    if (index != -1) {
      final updatedNote = Note(
        id: id,
        title: title,
        content: content,
        status: status,
        dateTime: dateTime,
        isNotificationOn: isNotificationOn,
      );
      existingNotes[index] = updatedNote;
      await _storage.write(key: _hashUserId(userId), value: jsonEncode(existingNotes.map((note) => note.toJson()).toList()));
      return updatedNote;
    }
    throw Exception('Note with id $id not found');
  }

  Future<void> deleteNote({
    required String userId,
    required int id,
  }) async {
    List<Note> existingNotes = await getNotes(userId: userId);
    existingNotes.removeWhere((note) => note.id == id);
    await _storage.write(key: _hashUserId(userId), value: jsonEncode(existingNotes.map((note) => note.toJson()).toList()));
  }
}
