import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:rem/helpers/app_export.dart';
import '../../app/base/base_view.dart';

// ignore: must_be_immutable
class SplashScreen extends BaseView<SplashController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgLogo,
                          height: 325.v,
                          width: 238.h,)
                    ]))));
  }

  
}
