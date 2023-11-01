import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeProvider extends ChangeNotifier {
  late Box _themeBox;
  ThemeData _currentTheme = ThemeData.light();

  ThemeProvider() {
    _initHive();
  }

  Future<void> _initHive() async {
    await Hive.initFlutter();
    _themeBox = await Hive.openBox('themeBox');
    final themeIndex = _themeBox.get('currentTheme', defaultValue: 0);
    _currentTheme = _getThemeFromIndex(themeIndex);
  }

  ThemeData get currentTheme => _currentTheme;

  void setTheme(int themeIndex) {
    _currentTheme = _getThemeFromIndex(themeIndex);
    _themeBox.put('currentTheme', themeIndex);
    notifyListeners();
  }

  ThemeData _getThemeFromIndex(int themeIndex) {
    switch (themeIndex) {
      case 0:
        return ThemeData.light();
      case 1:
        return ThemeData.dark();
      default:
        return ThemeData.light();
    }
  }
}
