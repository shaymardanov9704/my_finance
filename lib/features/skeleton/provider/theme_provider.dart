import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_finance/core/constants/constants.dart';
import 'package:my_finance/core/utils/app_themes.dart';

class ThemeProvider extends ChangeNotifier {
  late Box _themeBox;
  ThemeData _currentTheme = AppThemes.light();

  ThemeProvider() {
    _initHive();
  }

  Future<void> _initHive() async {
    await Hive.initFlutter();
    _themeBox = await Hive.openBox(kThemeBox);
    final themeIndex = _themeBox.get(kCurrentTheme, defaultValue: 0);
    _currentTheme = _getThemeFromIndex(themeIndex);
  }

  ThemeData get currentTheme => _currentTheme;

  bool get isDark => currentTheme.brightness == Brightness.dark;

  void setTheme(int themeIndex) {
    _currentTheme = _getThemeFromIndex(themeIndex);
    _themeBox.put(kCurrentTheme, themeIndex);
    notifyListeners();
  }

  ThemeData _getThemeFromIndex(int themeIndex) {
    switch (themeIndex) {
      case 0:
        return AppThemes.light();
      case 1:
        return AppThemes.dark();
      default:
        return AppThemes.light();
    }
  }
}
