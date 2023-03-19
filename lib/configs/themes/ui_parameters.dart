import 'package:flutter/material.dart';
import 'package:get/get.dart';

double _mobileScreenpadding = 20.0;
double _cardBorderRadius = 10;

double get mobilescreenpadding => _mobileScreenpadding;
double get cardBorderRadius => _cardBorderRadius;
double get mobileScreenpadding => _mobileScreenpadding;




class UIparameters {
  static BorderRadius get cardBorderRadius => BorderRadius.circular(_cardBorderRadius);
  static EdgeInsets get mobilescreenpadding =>
      EdgeInsets.all(_mobileScreenpadding);
  static bool isdarkMode() {
    return Get.isDarkMode?true:false;
  }
}
