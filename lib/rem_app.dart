import 'package:flutter/material.dart';
import 'theme/theme_config.dart';
import 'flavors/build_config.dart';
import 'flavors/env_config.dart';
import 'helpers/app_export.dart';
import 'routes/app_routes.dart';
import 'app/bindings/initial_binding.dart';

class RemApp extends StatelessWidget {
  RemApp({
    required this.isDarkTheme,
    required this.appLocale,
    super.key,
  });

  final bool isDarkTheme;
  final Locale appLocale;

  final EnvConfig _envConfig = BuildConfig.instance.config;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.lightTheme,
        darkTheme: ThemeConfig.darkTheme,
        themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
        defaultTransition: Transition.noTransition,
        translations: AppLocalization(),
        locale: Get.deviceLocale, //for setting localization strings
        fallbackLocale: Locale('en', 'US'),
        title: _envConfig.appName,
        initialBinding: InitialBinding(),
        initialRoute: AppRoutes.splash,
        getPages: AppPages.pages,
      );
    });
  }
}
