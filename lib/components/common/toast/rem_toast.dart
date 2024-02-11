import 'package:get/get.dart';

import '../../../helpers/constants/color_constants.dart';

class RemToast {
  static success({
    required String title,
    required String msg,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
  }) {
    Get.snackbar(title, msg,
        backgroundColor: ColorConstants.remSuccess,
        colorText: ColorConstants.white,
        snackPosition: snackPosition);
  }

  static error({
    required String title,
    required String msg,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
  }) {
    Get.snackbar(title, msg,
        backgroundColor: ColorConstants.remError,
        colorText: ColorConstants.white,
        snackPosition: snackPosition);
  }

  static info({
    required String title,
    required String msg,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
  }) {
    Get.snackbar(title, msg,
        backgroundColor: ColorConstants.remBlue,
        colorText: ColorConstants.white,
        snackPosition: snackPosition);
  }

  static warning({
    required String title,
    required String msg,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
  }) {
    Get.snackbar(title, msg,
        backgroundColor: ColorConstants.remWarning,
        colorText: ColorConstants.white,
        snackPosition: snackPosition);
  }
}
