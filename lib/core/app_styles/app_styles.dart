import 'package:flutter/material.dart';
import 'package:wasil/core/app_constance/app_constance.dart';

abstract class AppStyles {
  static const TextStyle style24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: AppConstance.primaryFontFamily,
  );

  static const TextStyle style28 = TextStyle(
    fontSize: 28,
    color: AppConstance.primaryAppColor,
    fontWeight: FontWeight.w600,
    fontFamily: AppConstance.primaryFontFamily,
  );

  static const TextStyle style18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Color(0xFF898A8D),
    fontFamily: AppConstance.primaryFontFamily,
  );

  static const TextStyle style20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: AppConstance.primaryFontFamily,
    color: Colors.white,
  );

  static const TextStyle style11 = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    fontFamily: AppConstance.primaryFontFamily,
    color: AppConstance.primaryAppColor,
  );

  static const TextStyle style13 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    fontFamily: AppConstance.primaryFontFamily,
    color: Colors.black,
  );

  static const TextStyle style22 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    fontFamily: AppConstance.primaryFontFamily,
    color: Colors.white,
  );

  static const TextStyle style14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: AppConstance.primaryFontFamily,
    color: AppConstance.primaryAppColor,
  );
}
