import 'package:get/get.dart';
import 'package:rem/app/controllers/local_notification_controller.dart';
import '../controllers/auth_controller.dart';

class ControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true, tag:(AuthController).toString());
    Get.put(LocalNotificationController(), permanent: true, );
  }
}
