import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  static final ThemeNotifier _themeNotifier = ThemeNotifier._internal();

  factory ThemeNotifier() {
    return _themeNotifier;
  }

  ThemeNotifier._internal();

  bool _isDark = false;

  bool get isDark => _isDark;

  set isDark(bool value) {
    _isDark = value;

    notifyListeners();
  }
}
