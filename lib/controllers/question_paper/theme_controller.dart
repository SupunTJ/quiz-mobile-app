import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_quiz_app/configs/themes/app_dark_theme.dart';
import 'package:mobile_quiz_app/configs/themes/app_light_theme.dart';

class ThemeController extends GetxController {
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;

  @override
  void onInit() {
    initializeThemeData();
    super.onInit();
  }

  initializeThemeData() {
    _darkTheme = DarkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buidLightTheme();
  }

  ThemeData get darkTheme1 => _darkTheme;
  ThemeData get lightTheme => _lightTheme;
}
