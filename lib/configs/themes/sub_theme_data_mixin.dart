import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

mixin SubthemeData {
  TextTheme gettextThemes() {
    return GoogleFonts.quicksandTextTheme(const TextTheme(
        bodyText1: TextStyle(fontWeight: FontWeight.w400),
        bodyText2: TextStyle(fontWeight: FontWeight.w200)));
  }

 IconThemeData getIconTheme() {
    return const IconThemeData(color: surfaceTextColor, size: 16);
  }
}
