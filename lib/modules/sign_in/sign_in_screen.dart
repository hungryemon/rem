import 'package:rem/app/base/base_view.dart';

import 'package:flutter/material.dart';
import 'package:rem/helpers/app_export.dart';
import 'package:rem/components/common/custom_elevated_button.dart';
import 'package:rem/components/common/custom_icon_button.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 39.v),
        child: Column(children: [
          Padding(
              padding: EdgeInsets.only(left: 17.h),
              child: CustomIconButton(
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  padding: EdgeInsets.all(6.h),
                  alignment: Alignment.centerLeft,
                  onTap: () {
                    controller.onPressBack();
                  },
                  child:
                      CustomImageView(imagePath: ImageConstant.imgArrowLeft))),
          SizedBox(height: 30.v),
          CustomImageView(
              imagePath: ImageConstant.imgLogoGray5001,
              height: 105.v,
              width: 117.h),
          SizedBox(height: 33.v),
          Text("lbl_get_in_through".tr, style: theme.textTheme.titleMedium),
          SizedBox(height: 33.v),
          CustomElevatedButton(
              text: "lbl_login".tr,
              buttonStyle: CustomButtonStyles.fillDeepOrange,
              buttonTextStyle: CustomTextStyles.titleSmallSecondaryContainer,
              onPressed: () {
                controller.onTapLogin();
              }),
          SizedBox(height: 5.v)
        ]));
  }

  
}
