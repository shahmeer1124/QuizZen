import 'package:firebase_master_class/configs/themes/sub_theme_data_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color primaryLightColorLight = Color(0xff3ac3cb);
const Color primaryColorLight = Color(0xFFf85187);
const Color mainTextColor = Color.fromARGB(255, 40, 40, 40);
const Color cardColor = Color.fromARGB(255, 254, 254, 255);

class LightTheme with SubthemeData {
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
        primaryColor: primaryColorLight,
        iconTheme: getIconTheme(),
        cardColor: cardColor,
        textTheme: gettextThemes().apply(
          bodyColor: mainTextColor,
          displayColor: mainTextColor,
        ));
  }
}
