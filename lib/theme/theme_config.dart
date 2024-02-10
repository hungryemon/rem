import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../helpers/app_export.dart';
import '../helpers/constants/color_constants.dart';

class ThemeConfig {
  static ThemeData createTheme({
    required Brightness brightness,
    required Color scaffoldBackgroundColor,
    required Color backgroundColor,
    required Color backgroundColorSecondary,
    required Color primaryTextColor,
    required Color captionTextColor,
    Color? secondaryTextColor,
    required Color accentColor,
    Color? overLineTextColor,
    Color? dividerColor,
    Color? buttonBackgroundColor,
    required Color buttonTextColor,
    Color? cardBackgroundColor,
    Color? disabledColor,
    required Color errorColor,
  }) {
    final baseTextTheme = brightness == Brightness.dark
        ? Typography.blackMountainView
        : Typography.whiteMountainView;

    return ThemeData(
      fontFamily: 'Poppins',
      useMaterial3: true,
      brightness: brightness,
      dialogBackgroundColor: cardBackgroundColor,
      navigationBarTheme: NavigationBarThemeData(
          backgroundColor: backgroundColor, indicatorColor: accentColor),
      canvasColor: cardBackgroundColor,
      cardColor: cardBackgroundColor,
      dividerColor: dividerColor,
      scaffoldBackgroundColor: backgroundColor,
      dividerTheme: DividerThemeData(
        color: dividerColor,
        space: 1,
        thickness: 1,
      ),
      cardTheme: CardTheme(
        color: cardBackgroundColor,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
      primaryColor: accentColor,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: accentColor,
        selectionHandleColor: accentColor,
        cursorColor: accentColor,
      ),
      focusColor: backgroundColorSecondary,
      appBarTheme: AppBarTheme(
        color: cardBackgroundColor,
        iconTheme: IconThemeData(
          color: secondaryTextColor,
        ),
      ),
      iconTheme: IconThemeData(
        color: primaryTextColor,
        size: 20.0,
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: accentColor,
          secondary: accentColor,
          surface: scaffoldBackgroundColor,
          background: scaffoldBackgroundColor,
          error: errorColor,
          onPrimary: buttonTextColor,
          onSecondary: buttonTextColor,
          onSurface: buttonTextColor,
          onBackground: buttonTextColor,
          onError: buttonTextColor,
        ),
        padding: const EdgeInsets.all(16.0),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: brightness,
        primaryColor: accentColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle:
            TextStyle(fontFamily: 'Poppins-Medium', color: errorColor),
        labelStyle: TextStyle(
          fontFamily: 'Poppins-Semi-Bold',
          fontWeight: FontWeight.w600,
          fontSize: 16.0.fSize,
          color: primaryTextColor.withOpacity(0.5),
        ),
        hintStyle: TextStyle(
          color: secondaryTextColor,
          fontSize: 13.0.fSize,
          fontWeight: FontWeight.w300,
          fontFamily: 'Poppins',
        ),
      ),
      unselectedWidgetColor: ColorConstants.ostadBlackOverlay,
      textTheme: TextTheme(
        displayLarge: baseTextTheme.displayLarge!.copyWith(
          color: primaryTextColor,
          fontSize: 30.0.fSize,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins-Bold',
        ),
        displayMedium: baseTextTheme.displayMedium!.copyWith(
          color: primaryTextColor,
          fontSize: 24.fSize,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins-Bold',
        ),
        displaySmall: baseTextTheme.displaySmall!.copyWith(
          color: primaryTextColor,
          fontSize: 22.fSize,
          fontWeight: FontWeight.w700,
          fontFamily: 'Poppins-Bold',
        ),
        headlineMedium: baseTextTheme.headlineMedium!.copyWith(
          color: primaryTextColor,
          fontSize: 20.fSize,
          fontWeight: FontWeight.w700,
          fontFamily: 'Poppins-Bold',
        ),
        headlineSmall: baseTextTheme.headlineSmall!.copyWith(
          color: secondaryTextColor,
          fontSize: 20.fSize,
          fontWeight: FontWeight.w700,
          fontFamily: 'Poppins-Bold',
        ),
        titleLarge: baseTextTheme.titleLarge!.copyWith(
          color: primaryTextColor,
          fontSize: 18.fSize,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins-Semi-Bold',
        ),
        bodyLarge: baseTextTheme.bodyLarge!.copyWith(
          color: secondaryTextColor,
          fontSize: 16.fSize,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins-Medium',
        ),
        bodyMedium: baseTextTheme.bodyMedium!.copyWith(
          color: captionTextColor,
          fontSize: 14.fSize,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins-Medium',
        ),
        labelLarge: baseTextTheme.labelLarge!.copyWith(
          color: primaryTextColor,
          fontSize: 14.0.fSize,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins-Semi-Bold',
        ),
        bodySmall: baseTextTheme.bodySmall!.copyWith(
          color: captionTextColor,
          fontSize: 12.0.fSize,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins-Medium',
        ),
        labelSmall: baseTextTheme.labelSmall!.copyWith(
            color: overLineTextColor,
            fontSize: 11.0.fSize,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins-Medium',
            letterSpacing: 0),
        titleMedium: baseTextTheme.titleMedium!.copyWith(
          color: primaryTextColor,
          fontSize: 18.0.fSize,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins-Semi-Bold',
        ),
        titleSmall: baseTextTheme.titleSmall!.copyWith(
          color: primaryTextColor,
          fontSize: 16.0.fSize,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins-Semi-Bold',
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return accentColor;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return accentColor;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return accentColor;
          }
          return null;
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return accentColor;
          }
          return null;
        }),
      ),
      colorScheme: ColorScheme(
        background: backgroundColor,
        error: errorColor,
        brightness: brightness,
        onBackground: backgroundColor,
        onError: errorColor,
        onPrimary: primaryTextColor,
        onSecondary: secondaryTextColor!,
        onSurface: primaryTextColor,
        primary: primaryTextColor,
        secondary: secondaryTextColor,
        surface: primaryTextColor,
      ),
    );
  }

  static ThemeData get lightTheme => createTheme(
      brightness: Brightness.light,
      scaffoldBackgroundColor: ColorConstants.white,
      cardBackgroundColor: ColorConstants.white,
      primaryTextColor: ColorConstants.ostadBlack,
      secondaryTextColor: ColorConstants.ostadBlack80,
      overLineTextColor: ColorConstants.ostadBlack60,
      captionTextColor: ColorConstants.ostadBlack60,
      accentColor: ColorConstants.ostadYellow,
      dividerColor: ColorConstants.ostadBlackOpac,
      buttonBackgroundColor: ColorConstants.ostadYellow,
      buttonTextColor: ColorConstants.ostadBlack,
      disabledColor: ColorConstants.ostadBlackOverlay,
      errorColor: ColorConstants.ostadError,
      backgroundColor: const Color(0xFFF9F9FA),
      backgroundColorSecondary: ColorConstants.white);

  static ThemeData get darkTheme => createTheme(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: ColorConstants.ostadBlack,
        backgroundColor: const Color(0xFF232B3A),
        backgroundColorSecondary: ColorConstants.ostadBlack,
        cardBackgroundColor: ColorConstants.ostadBlack,
        primaryTextColor: ColorConstants.white,
        secondaryTextColor: ColorConstants.white,
        overLineTextColor: ColorConstants.white,
        captionTextColor: ColorConstants.white,
        accentColor: ColorConstants.ostadYellow,
        dividerColor: ColorConstants.ostadBlack60,
        buttonBackgroundColor: ColorConstants.ostadYellow,
        buttonTextColor: ColorConstants.white,
        disabledColor: ColorConstants.ostadBlackOverlay,
        errorColor: ColorConstants.ostadError,
      );
}
