import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  static final ThemeNotifier _themeNotifier = ThemeNotifier._internal();

  factory ThemeNotifier() {
    return _themeNotifier;
  }

  ThemeNotifier._internal();

  Color _color = Colors.yellow;

  Color get color => _color;

  set color(Color value) {
    _color = value;

    notifyListeners();
  }
}
