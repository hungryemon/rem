import 'package:rem/app/base/base_view.dart';

import 'package:flutter/material.dart';
import 'package:rem/helpers/app_export.dart';
import 'package:rem/components/common/custom_elevated_button.dart';
import 'package:rem/modules/sign_in/controller/sign_in_controller.dart';

// ignore: must_be_immutable
class SignInScreen extends BaseView<SignInController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 40.v),
        child: Column(children: [
    
          SizedBox(height: 32.v),
          CustomImageView(
              imagePath: ImageConstant.imgLogoGray5001,
              height: 105.v,
              width: 117.h),
          SizedBox(height: 32.v),
          Text("Get in Through".tr, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 32.v),
          CustomElevatedButton(
              text: "Login".tr,
              buttonStyle: CustomButtonStyles.fillDeepOrange,
              buttonTextStyle: CustomTextStyles.titleSmallSecondaryContainer,
              onPressed: () {
                controller.onTapLogin();
              }),
          SizedBox(height: 4.v)
        ]));
  }

  
}
