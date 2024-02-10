import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/helpers/app_export.dart';
import 'base_controller.dart';

abstract class BaseRemController extends BaseController {
  PreferenceManager preferenceManager = PreferenceManager();

  void changeStatusBarTheme({Brightness? statusBarBrightness}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(Get.context!).colorScheme.background,
      systemNavigationBarColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      statusBarIconBrightness: statusBarBrightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
      statusBarBrightness: statusBarBrightness,
    ));
  }

  void changeThemeMode(
      {required ThemeMode toThemeMode, Function()? onUpdateTheme}) {
    ThemeMode tempToThemeMode =
        toThemeMode == ThemeMode.dark ? ThemeMode.dark : ThemeMode.light;

    Get.changeThemeMode(tempToThemeMode);
    preferenceManager.setBool(
        PreferenceManager.KEY_IS_DARK_THEME, toThemeMode == ThemeMode.dark ? true : false);
    if (onUpdateTheme != null) {
      onUpdateTheme();
    }
    if (Platform.isIOS) {
      changeStatusBarTheme(
          statusBarBrightness: toThemeMode == ThemeMode.dark
              ? Brightness.dark
              : Brightness.light);
    }
  }

  @override
  void onDetached() {
    logger.d("BaseController onDetached");
  }

  @override
  void onInactive() {
    logger.d("BaseController onInactive");
  }

  @override
  void onPaused() {
    logger.d("BaseController onPaused");
  }

  @override
  void onResumed() {
    logger.d("BaseController onResumed");
  }

  @override
  void onHidden() {
    logger.d("BaseController onHidden");
  }
}
