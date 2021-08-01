import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager {
  static String _themeKey = 'themeData';

  ThemeData lightTheme = ThemeData.light();
  ThemeData darkTheme = ThemeData.dark().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.black87,
      )
    )
  );

  Future<bool> getCurrentTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(_themeKey)) {
      return false;
    } else {
      bool isDark = prefs.getBool(_themeKey) as bool;
      if (isDark) {
        return true;
      } else {
        return false;
      }
    }
  }

  static Future<bool> setCurrentTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(_themeKey, isDark);
  }
}
