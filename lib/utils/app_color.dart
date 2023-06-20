import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxBool isdark = true.obs;

class AppColor {
  static const bool dark = true;
  static const bool light = false;

  static const Map<bool, Color> whitecolor = {
    dark: Colors.black,
    light: Colors.white,
  };
  static const Map<bool, Color> blackcolor = {
    dark: Colors.white,
    light: Colors.black,
  };
  static const Map<bool, Color> lightgreyc = {
    dark: Color(0xff121212),
    light: Color(0xffededed),
  };

  static Color primaryColor = Color(0xFFF58534);
  static Color music = Color(0xffbee4f1);
  static Color secondaryColor = const Color(0xFF80371B);
  static Color btnColor = const Color(0xFF4185F4);
  static Color grey = Colors.grey;
  static Color green = Colors.green;
  static Color red = Colors.red;
  static Color ambr = Colors.amber;
}
