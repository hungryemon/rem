import '../controller/view_todo_controller.dart';
import 'package:get/get.dart';

/// A binding class for the WishListScreen.
///
/// This class ensures that the WishListController is created when the
/// WishListScreen is first loaded.
class ViewTodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewTodoController());
  }
}
