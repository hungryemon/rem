import 'package:rem/helpers/app_export.dart';
import 'package:rem/modules/home/models/home_model.dart';
import '../../../app/base/base_rem_controller.dart';

/// A controller class for the HomeScreen.
///
/// This class manages the state of the HomeScreen, including the
/// current homeModelObj
class HomeController extends BaseRemController {
  Rx<HomeModel> homeModelObj = HomeModel().obs;
}
