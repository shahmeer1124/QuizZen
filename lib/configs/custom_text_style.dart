import 'package:firebase_master_class/configs/themes/app_color.dart';
import 'package:firebase_master_class/configs/themes/ui_parameters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextStyle cardTitle(context) => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: UIparameters.isdarkMode()
        ? Theme.of(context).textTheme.bodyLarge!.color
        : Theme.of(context).primaryColor);
const QuestionText = TextStyle(fontSize: 16, fontWeight: FontWeight.w800);
const DetailText = TextStyle(fontSize: 12);
const HeaderText = TextStyle(
    fontSize: 22, fontWeight: FontWeight.w700, color: surfaceTextColor);
const appBarTs = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 16, color: surfaceTextColor);
TextStyle countDownTs() => TextStyle(
  letterSpacing: 2,
  color: UIparameters.isdarkMode()?Theme.of(Get.context!).textTheme.bodyText1!.color:Theme.of(Get.context!).primaryColor
);
