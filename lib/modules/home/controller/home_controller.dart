import 'package:flutter/material.dart';
import 'package:rem/app/controllers/auth_controller.dart';
import 'package:rem/app/controllers/local_notification_controller.dart';
import 'package:rem/helpers/app_export.dart';
import 'package:rem/modules/home/models/home_model.dart';
import '../../../data/model/response/mock_note_response.dart';
import '../../../data/repository/mock_note_repository/mock_note_repository.dart';

/// A controller class for the HomeScreen.
///
/// This class manages the state of the HomeScreen, including the
/// current homeModelObj
class HomeController extends BaseRemController {
  Rx<HomeModel> homeModelObj = HomeModel().obs;
  final notes = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    initialNote();
  }

  LocalNotificationController localNotificationController = Get.find();

  final MockNoteRepository _mockNoteRepository =
      Get.find(tag: (MockNoteRepository).toString());

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final Rx<String> selectedStatus = 'Pending'.obs;
  final RxBool isNotificationOn = false.obs;

  initialNote() async {
    // for (var i = 0; i < 2; i++) {
    //   await _mockNoteRepository.createNote(
    //       userId: AuthController.instance().getUserId(),
    //       title: "Title $i",
    //       content: "Content $i",
    //       status: NoteStatus.Pending,
    //       dateTime: DateTime.now());
    // }

    fetchNotes();
  }

  Future<void> fetchNotes() async {
    final fetchedNotes = await _mockNoteRepository.getNotes(
        userId: AuthController.instance().getUserId());
    notes.assignAll(fetchedNotes);
  }

  Future<void> addNote({
    required String title,
    required String content,
    required NoteStatus status,
    required DateTime dateTime,
    required bool isNotificationOn,
  }) async {
    final newNote = await _mockNoteRepository.createNote(
      userId: AuthController.instance().getUserId(),
      title: title,
      content: content,
      status: status,
      dateTime: dateTime,
      isNotificationOn: isNotificationOn,
    );
    if (isNotificationOn && newNote.dateTime.isAfter(DateTime.now())) {
      await localNotificationController.stopNotificationById(newNote.id);
      await localNotificationController.showScheduledNotification(
          id: newNote.id,
          title: newNote.title,
          body: "Rem",
          date: newNote.dateTime,
          payload: newNote.title);
    }
    notes.add(newNote);
  }

  Future<void> updateNote({
    required int id,
    required String title,
    required String content,
    required NoteStatus status,
    required DateTime dateTime,
    required bool isNotificationOn,
  }) async {
    await _mockNoteRepository.updateNote(
      userId: AuthController.instance().getUserId(),
      id: id,
      title: title,
      content: content,
      status: status,
      dateTime: dateTime,
      isNotificationOn: isNotificationOn,
    );

    final index = notes.indexWhere((note) => note.id == id);
    if (index != -1) {
      notes[index] = Note(
        id: id,
        title: title,
        content: content,
        status: status,
        dateTime: dateTime,
        isNotificationOn: isNotificationOn,
      );
    }
    if (isNotificationOn && dateTime.isAfter(DateTime.now())) {
      await localNotificationController.stopNotificationById(id);
      await localNotificationController.showScheduledNotification(
          id: id, title: title, body: "Rem", date: dateTime, payload: title);
    } else {
      await localNotificationController.stopNotificationById(id);
    }
  }

  Future<void> deleteNote({
    required int id,
  }) async {
    await _mockNoteRepository.deleteNote(
        userId: AuthController.instance().getUserId(), id: id);
    await localNotificationController.stopNotificationById(id);
    notes.removeWhere((note) => note.id == id);
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
}
