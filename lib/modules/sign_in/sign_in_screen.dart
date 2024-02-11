
import 'package:flutter/material.dart';
import 'package:rem/helpers/app_export.dart';
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
          Text("Get in Through".tr,
              style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 32.v),
          CustomElevatedButton(
              leftIcon: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CustomImageView(
                  imagePath: ImageConstant.imgGoogle,
                  height: 24.v,
                  width: 24.h,
                ),
              ),
              text: "Login with Google".tr,
              buttonStyle: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor),
              buttonTextStyle: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: ColorConstants.remBlack),
              onPressed: () {
                controller.onTapLogin();
              }),
          SizedBox(height: 4.v)
        ]));
  }
}
