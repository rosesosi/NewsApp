import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLang = 'en';

  void changeLocale(String newLocale) async {
    if (newLocale == currentLang) {
      return;
    }
    currentLang = newLocale;

    notifyListeners();
  }
}
