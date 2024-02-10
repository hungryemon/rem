import 'package:rem/app/base/base_rem_controller.dart';
import 'package:rem/helpers/app_export.dart';
import 'package:rem/modules/sign_in/models/sign_in_model.dart';

/// A controller class for the SignInScreen.
///
/// This class manages the state of the SignInScreen, including the
/// current signInModelObj
class SignInController extends BaseRemController {
  Rx<SignInModel> signInModelObj = SignInModel().obs;

  /// Navigates to the previous screen.
  onPressBack() {
    Get.back();
  }

  ///TODO: Google Sign In when the action is triggered.
  onTapLogin() {}
}
