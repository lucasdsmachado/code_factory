import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const String _themePrefKey = 'isDarkTheme';
  static const String _notificationsPrefKey = 'notificationsEnabled';
  
  bool _isDarkTheme = false;
  bool _notificationsEnabled = false;

  bool get isDarkTheme => _isDarkTheme;
  bool get notificationsEnabled => _notificationsEnabled;

  ThemeProvider({bool isDarkTheme = false, bool notificationsEnabled = false}) {
    _isDarkTheme = isDarkTheme;
    _notificationsEnabled = notificationsEnabled;
    _loadPreferences();
  }

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    _savePreferences();
    notifyListeners();
  }

  void toggleNotifications() {
    _notificationsEnabled = !_notificationsEnabled;
    _savePreferences();
    notifyListeners();
  }

  void _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = prefs.getBool(_themePrefKey) ?? false;
    _notificationsEnabled = prefs.getBool(_notificationsPrefKey) ?? false;
    notifyListeners();
  }

  void _savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_themePrefKey, _isDarkTheme);
    prefs.setBool(_notificationsPrefKey, _notificationsEnabled);
  }
}
