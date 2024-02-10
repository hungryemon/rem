import 'package:rem/helpers/app_export.dart';
import 'package:rem/modules/splash/models/splash_model.dart';

import '../../../routes/app_routes.dart';
import '../../../app/base/base_rem_controller.dart';

/// A controller class for the SplashScreen.
///
/// This class manages the state of the SplashScreen, including the
/// current splashModelObj
class SplashController extends BaseRemController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(
        AppRoutes.signIn,
      );
    });
  }
}
