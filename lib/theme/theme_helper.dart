import 'package:flutter/material.dart';
import '../helpers/app_export.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {

// A map of custom color themes supported by the app

// A map of color schemes supported by the app



  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
 
    //return theme from map

    return PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
 
    //return theme from map

    var colorScheme =ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.whiteA700,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.redA40066,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: colorScheme.onPrimary.withOpacity(0.4),
          fontSize: 18.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 14.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: colorScheme.onPrimary.withOpacity(0.4),
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 34.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 28.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: colorScheme.onPrimary.withOpacity(0.4),
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 20.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 18.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: colorScheme.onPrimary.withOpacity(0.4),
          fontSize: 14.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF20B9FC),
    secondaryContainer: Color(0X0CFD6B22),

    // On colors(text colors)
    onPrimary: Color(0XCC1B1F31),
    onPrimaryContainer: Color(0XFFD6D6D6),
  );

  static final secondaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF20B9FC),
    secondaryContainer: Color(0X0CFD6B22),

    // On colors(text colors)
    onPrimary: Color(0XCC1B1F31),
    onPrimaryContainer: Color(0XFFD6D6D6),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF000000);

  // DeepOrange
  Color get deepOrange50 => Color(0XFFF9ECE9);

  // DeepPurple
  Color get deepPurpleA400 => Color(0XFF5835FB);

  // Gray
  Color get gray50 => Color(0XFFF9F9F9);
  Color get gray5001 => Color(0XFFF9FAFF);
  Color get gray5002 => Color(0XFFF4FBF8);
  Color get gray5003 => Color(0XFFF7F5FF);

  // RedAc
  Color get redA4000c => Color(0X0CFD2222);

  // Red
  Color get redA40066 => Color(0X66FD2121);

  // Teal
  Color get teal400 => Color(0XFF22B07D);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
}

/// Class containing custom colors for a secondary theme.
class SecondaryColors extends PrimaryColors {
  // Black
  Color get black900 => Color(0XFF000000);

  // DeepOrange
  Color get deepOrange50 => Color(0XFFF9ECE9);

  // DeepPurple
  Color get deepPurpleA400 => Color(0XFF5835FB);

  // Gray
  Color get gray50 => Color(0XFFF9F9F9);
  Color get gray5001 => Color(0XFFF9FAFF);
  Color get gray5002 => Color(0XFFF4FBF8);
  Color get gray5003 => Color(0XFFF7F5FF);

  // RedAc
  Color get redA4000c => Color(0X0CFD2222);

  // Red
  Color get redA40066 => Color(0X66FD2121);

  // Teal
  Color get teal400 => Color(0XFF22B07D);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
