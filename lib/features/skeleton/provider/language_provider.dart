import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  late Locale _appLocale;

  Locale get locale => _appLocale;

  LanguageProvider() {
    _appLocale = const Locale('uz', "UZ");
  }

  void setLocale(Locale newLocale) {
    _appLocale = newLocale;
    notifyListeners();
  }
}
