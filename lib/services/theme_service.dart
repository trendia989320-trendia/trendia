import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  static final ThemeService _instance = ThemeService._internal();

  factory ThemeService() {
    return _instance;
  }

  ThemeService._internal();

  String _currentTheme = 'Light';

  String get currentTheme => _currentTheme;

  void setTheme(String theme) {
    _currentTheme = theme;
    notifyListeners();
  }

  bool isDarkMode() {
    return _currentTheme == 'Dark';
  }

  bool isLightMode() {
    return _currentTheme == 'Light';
  }
}
