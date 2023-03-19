import 'package:firebase_master_class/configs/themes/sub_theme_data_mixin.dart';
import 'package:flutter/material.dart';

import 'app_light_theme.dart';

const Color primaryDarkColor = Color(0xFF2e3c62);
const Color primaryColorDark = Color(0xFF99ace1);

class DarkTheme with SubthemeData {
  ThemeData buildDarkTheme() {
    final ThemeData systemdarktheme = ThemeData.dark();
    return systemdarktheme.copyWith(
        iconTheme: getIconTheme(),
        textTheme: gettextThemes().apply(
          bodyColor: mainTextColor,
          displayColor: mainTextColor,
        ));
  }
}
