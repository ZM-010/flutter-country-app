import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController with WidgetsBindingObserver {
  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  static const _themeKey = 'theme_mode';



  Brightness get currentBrightness =>
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    _loadThemeFromStorage();
    ever(themeMode, (mode) {
      _updateSystemUI();
      _saveThemeToStorage(mode);
    });
  }

  @override
  void onClose() {
    super.onClose();
    WidgetsBinding.instance.removeObserver(this);
  }

  Future<void> _saveThemeToStorage(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, mode.name);
  }

  void toggleTheme() {
    if (themeMode.value == ThemeMode.dark) {
      themeMode.value = ThemeMode.light;
    } else {
      themeMode.value = ThemeMode.dark;
    }
  }


  Future<void> _loadThemeFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final storedTheme = prefs.getString(_themeKey);

    if (storedTheme != null) {
      switch (storedTheme) {
        case 'dark':
          themeMode.value = ThemeMode.dark;
          break;
        case 'light':
          themeMode.value = ThemeMode.light;
          break;
        default:
          themeMode.value = ThemeMode.system;
      }
    } else {
      themeMode.value =
      currentBrightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;
    }
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    if (themeMode.value == ThemeMode.system) {
      themeMode.value =
      currentBrightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;
    }
  }

  void toggleMode(bool isDark) {
    themeMode.value = isDark ? ThemeMode.dark : ThemeMode.light;
    _saveThemeToStorage(themeMode.value);
  }

  bool _isDarkMode() {
    if (themeMode.value == ThemeMode.system) {
      return currentBrightness == Brightness.dark;
    } else {
      return themeMode.value == ThemeMode.dark;
    }
  }

  void _updateSystemUI() {
    final isDark = _isDarkMode();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: isDark ? Colors.black : Colors.white,
        systemNavigationBarIconBrightness:
        isDark ? Brightness.light : Brightness.dark,
      ),
    );
  }
}
