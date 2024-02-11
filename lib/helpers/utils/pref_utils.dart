//ignore: unused_import
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class PreferenceManager {
  static SharedPreferences? _preference;

  static const KEY_SAVED_LOCALE_LANGUAGE_CODE = "savedLocaleLanguageCode";
  static const KEY_SAVED_LOCALE_COUNTRY_CODE = "savedLocaleCountryCode";
  static const KEY_IS_DARK_THEME = "isDarkTheme";

  PreferenceManager() {
    // init();
    SharedPreferences.getInstance().then((value) {
      _preference = value;
    });
  }

 


  String getString(String key, {String defaultValue = ""}) {
    return _preference?.getString(key) ?? defaultValue;
  }

 
  Future<bool>? setString(String key, String value) {
    return _preference?.setString(key, value);
  }

 
  int getInt(String key, {int defaultValue = 0}) {
    return _preference?.getInt(key) ?? defaultValue;
  }


  Future<bool>? setInt(String key, int value) {
    return _preference?.setInt(key, value);
  }


  double getDouble(String key, {double defaultValue = 0.0}) {
    return _preference?.getDouble(key) ?? defaultValue;
  }


  Future<bool>? setDouble(String key, double value) {
    return _preference?.setDouble(key, value);
  }

 
  bool getBool(String key, {bool defaultValue = false}) {
    return _preference?.getBool(key) ?? defaultValue;
  }


  Future<bool>? setBool(String key, bool value) {
    return _preference?.setBool(key, value);
  }


  List<String> getStringList(String key,
      {List<String> defaultValue = const []}) {
    return _preference?.getStringList(key) ?? defaultValue;
  }


  Future<bool>? setStringList(String key, List<String> value) {
    return _preference?.setStringList(key, value);
  }


  Future<bool>? remove(String key) {
    return _preference?.remove(key);
  }


  Future<bool>? clear() {
    return _preference?.clear();
  }
 
}
