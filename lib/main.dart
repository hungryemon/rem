import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';
import 'rem_app.dart';
import 'flavors/build_config.dart';
import 'flavors/env_config.dart';
import 'flavors/environment.dart';
import 'helpers/app_export.dart';
import 'helpers/constants/api_constants.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]).then((value) async {
      PreferenceManager _pref = PreferenceManager();

      bool isDarkTheme = _pref.getBool(PreferenceManager.KEY_IS_DARK_THEME,
          defaultValue: false);
      String savedLocaleLanguageCode = _pref.getString(
          PreferenceManager.KEY_SAVED_LOCALE_LANGUAGE_CODE,
          defaultValue: 'en');
      String savedLocaleCountryCode = _pref.getString(
          PreferenceManager.KEY_SAVED_LOCALE_COUNTRY_CODE,
          defaultValue: 'US');

      if (Platform.isIOS) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarBrightness: isDarkTheme ? Brightness.dark : Brightness.light,
          statusBarIconBrightness:
              isDarkTheme ? Brightness.light : Brightness.dark,
        ));
      }
      EnvConfig prodConfig = EnvConfig(
        appName: "Rem",
        baseUrl: ApiConstants.apiBaseUrlProd,
        shouldCollectLog: true,
      );

      BuildConfig.instantiate(
        envType: Environment.PRODUCTION,
        envConfig: prodConfig,
      );
      return runApp(RemApp(
        isDarkTheme: isDarkTheme,
        appLocale: Locale(savedLocaleLanguageCode, savedLocaleCountryCode),
      ));
    });
  }, (error, stack) async {
    debugPrint(error.toString());
  });
}
