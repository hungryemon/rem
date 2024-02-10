import 'package:rem/helpers/app_export.dart';
import '../../../app/base/base_rem_controller.dart';
import '../models/create_todo_model.dart';

/// A controller class for the CreateTodoScreen.
///
/// This class manages the state of the CreateTodoScreen, including the
/// current createTodoModelObj
class CreateTodoController extends BaseRemController {
  Rx<CreateTodoModel> createTodoModelObj = CreateTodoModel().obs;
}
