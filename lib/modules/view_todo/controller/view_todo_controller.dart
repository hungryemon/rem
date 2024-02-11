import 'package:rem/helpers/app_export.dart';
import 'package:rem/modules/view_todo/models/view_todo_model.dart';
import '../../../app/base/base_rem_controller.dart';

/// A controller class for the ViewTodoScreen.
///
/// This class manages the state of the ViewTodoScreen, including the
/// current viewTodoModelObj
class ViewTodoController extends BaseRemController {
  onInit() {
    viewTodoModelObj(Get.arguments?['arg'] ?? ViewTodoModel());
    super.onInit();
  }

  Rx<ViewTodoModel> viewTodoModelObj = ViewTodoModel().obs;
}
