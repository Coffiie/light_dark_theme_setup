import 'package:flutter/material.dart';
import 'package:theme_dark_light/theme_manager.dart';

class AppState extends ChangeNotifier {
  static final AppState _singleton = AppState._internal();

  factory AppState() {
    return _singleton;
  }

  AppState._internal();

  ThemeManager themeManager = ThemeManager();

  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;
  set isDarkTheme(bool val) {
    _isDarkTheme = val;
    ThemeManager.setCurrentTheme(val);
    notifyListeners();
  }

  Future<void> init() async {
    isDarkTheme = await themeManager.getCurrentTheme();
  }
}
