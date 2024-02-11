import 'package:get/get.dart';

import '../../data/repository/mock_note_repository/mock_note_repository.dart';
import '../../data/repository/mock_note_repository/mock_note_repository_impl.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
   Get.lazyPut<MockNoteRepository>(() =>MockNoteRepositoryImpl(),
        tag: (MockNoteRepository).toString(), fenix: true);
  }
}
