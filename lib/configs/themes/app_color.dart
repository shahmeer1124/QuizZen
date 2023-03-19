import 'package:firebase_master_class/configs/themes/ui_parameters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'app_dark_theme.dart';
import 'app_light_theme.dart';

const Color surfaceTextColor = Colors.white;
const Color correctAnswercolor = Color(0xFF3ac3cb);
const Color wrongAnswerColor = Color(0xFFf85187);
const Color notansweredColor = Color(0xFF2a3c65);
const maingradientlight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLightColorLight, primaryColorLight]);

const maingradientdark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryDarkColor, primaryColorDark]);

LinearGradient mainGradient() =>
    UIparameters.isdarkMode() ? maingradientdark : maingradientlight;

Color customScaffoldColor(BuildContext context) => UIparameters.isdarkMode()
    ? const Color(0xFF2e3c62)
    : const Color.fromARGB(255, 240, 237, 255);

Color answerSelectedColor() => UIparameters.isdarkMode()
    ? Theme.of(Get.context!).cardColor.withOpacity(0.5)
    : Theme.of(Get.context!).primaryColor;

Color answerBorderColor() => UIparameters.isdarkMode()
    ? const Color.fromARGB(255, 20, 46, 158)
    : const Color.fromARGB(255, 221, 221, 221);
