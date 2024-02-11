import 'package:rem/app/controllers/auth_controller.dart';
import 'package:rem/helpers/app_export.dart';
import 'package:rem/modules/sign_in/models/sign_in_model.dart';
import 'package:rem/routes/app_routes.dart';

/// A controller class for the SignInScreen.
///
/// This class manages the state of the SignInScreen, including the
/// current signInModelObj
class SignInController extends BaseRemController {
  Rx<SignInModel> signInModelObj = SignInModel().obs;

  
  // Google Sign In when the action is triggered.
  onTapLogin() async {
    await AuthController.instance().signInWithGoogle();
    Get.toNamed(AppRoutes.home);
  }
}
