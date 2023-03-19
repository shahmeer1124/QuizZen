import 'package:firebase_master_class/configs/themes/app_dark_theme.dart';
import 'package:firebase_master_class/configs/themes/app_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  late ThemeData _lightThemeData;
  late ThemeData _darkThemeData;
  @override
  void onInit() {
    // TODO: implement onInit
    InitializeThemeData();
    super.onInit();
  }

  InitializeThemeData() {
    _lightThemeData = LightTheme().buildLightTheme();
    _darkThemeData = DarkTheme().buildDarkTheme();
  }

  ThemeData get darkTheme => _darkThemeData;
  ThemeData get lightTheme => _lightThemeData;

}
