import '../controller/create_todo_controller.dart';
import 'package:get/get.dart';

/// A binding class for the WorkTodayScreen.
///
/// This class ensures that the WorkTodayController is created when the
/// WorkTodayScreen is first loaded.
class CreateTodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateTodoController());
  }
}
